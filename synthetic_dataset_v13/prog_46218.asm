; DESCRIPTION: Composite: Places a cyan circle of radius 64 at center (124, 70) then Sets a single black pixel at (444, 88) then Renders a orange line between points (463, 78) and (364, 83).
; PLAN: r0=124(x), r1=70(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x), r6=88(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=463(x1), r11=78(y1), r12=364(x2), r13=83(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 70
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 88
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 463
LDI r11, 78
LDI r12, 364
LDI r13, 83
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
