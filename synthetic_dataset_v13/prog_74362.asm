; DESCRIPTION: Composite: Draws a purple line from (472, 171) to (352, 13) then Places a magenta circle of radius 69 at center (358, 88) then Places a cyan dot at position (129, 3).
; PLAN: r0=472(x1), r1=171(y1), r2=352(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=88(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=129(x), r11=3(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 472
LDI r1, 171
LDI r2, 352
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 88
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 129
LDI r11, 3
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
