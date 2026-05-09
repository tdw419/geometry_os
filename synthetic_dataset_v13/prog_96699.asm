; DESCRIPTION: Composite: Sets a single cyan pixel at (308, 171) then Renders a black disk with center (439, 87) and radius 29 then Renders a black line between points (414, 177) and (200, 1).
; PLAN: r0=308(x), r1=171(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=439(x), r6=87(y), r7=29(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=414(x1), r11=177(y1), r12=200(x2), r13=1(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 171
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 439
LDI r6, 87
LDI r7, 29
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 414
LDI r11, 177
LDI r12, 200
LDI r13, 1
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
