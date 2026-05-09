; DESCRIPTION: Composite: Places a yellow dot at position (308, 226) then Creates a black circular shape at (245, 129) with radius 22 then Places a purple line segment connecting (92, 124) to (5, 106).
; PLAN: r0=308(x), r1=226(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=129(y), r7=22(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x1), r11=124(y1), r12=5(x2), r13=106(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 226
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 245
LDI r6, 129
LDI r7, 22
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 124
LDI r12, 5
LDI r13, 106
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
