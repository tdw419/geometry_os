; DESCRIPTION: Composite: Renders a orange line between points (92, 192) and (335, 16) then Creates a blue circular shape at (227, 188) with radius 11 then Sets a single black pixel at (308, 192).
; PLAN: r0=92(x1), r1=192(y1), r2=335(x2), r3=16(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=188(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=308(x), r11=192(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 92
LDI r1, 192
LDI r2, 335
LDI r3, 16
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 188
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 308
LDI r11, 192
LDI r12, 0x000000
PSET r10, r11, r12
HALT
