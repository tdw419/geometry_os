; DESCRIPTION: Composite: Places a red 74x35 rectangle at position (286, 154) then Draws a magenta circle centered at (154, 132) with radius 76 then Places a blue dot at position (303, 207).
; PLAN: r0=286(x), r1=154(y), r2=74(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=132(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=303(x), r11=207(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 154
LDI r2, 74
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 132
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 303
LDI r11, 207
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
