; DESCRIPTION: Composite: Sets a single cyan pixel at (506, 198) then Draws a blue circle centered at (211, 175) with radius 66 then Renders a white line between points (495, 86) and (390, 83).
; PLAN: r0=506(x), r1=198(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=175(y), r7=66(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=495(x1), r11=86(y1), r12=390(x2), r13=83(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 506
LDI r1, 198
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 175
LDI r7, 66
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 495
LDI r11, 86
LDI r12, 390
LDI r13, 83
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
