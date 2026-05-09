; DESCRIPTION: Composite: Places a magenta 19x92 rectangle at position (229, 156) then Draws a magenta circle centered at (194, 35) with radius 25 then Places a magenta dot at position (98, 185).
; PLAN: r0=229(x), r1=156(y), r2=19(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=35(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=98(x), r11=185(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 229
LDI r1, 156
LDI r2, 19
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 35
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 98
LDI r11, 185
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
