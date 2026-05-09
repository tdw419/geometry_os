; DESCRIPTION: Composite: Draws a black rectangle at (286, 148) with width 20 and height 75 then Draws a cyan circle centered at (131, 54) with radius 51 then Places a magenta dot at position (429, 246).
; PLAN: r0=286(x), r1=148(y), r2=20(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=54(y), r7=51(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=429(x), r11=246(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 148
LDI r2, 20
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 54
LDI r7, 51
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 429
LDI r11, 246
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
