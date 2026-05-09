; DESCRIPTION: Composite: Places a orange dot at position (494, 101) then Places a blue circle of radius 77 at center (246, 78) then Draws a purple line from (175, 64) to (321, 29).
; PLAN: r0=494(x), r1=101(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=78(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x1), r11=64(y1), r12=321(x2), r13=29(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 494
LDI r1, 101
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 246
LDI r6, 78
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 64
LDI r12, 321
LDI r13, 29
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
