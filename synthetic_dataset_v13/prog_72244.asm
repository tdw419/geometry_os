; DESCRIPTION: Composite: Sets a single green pixel at (348, 105) then Renders a cyan disk with center (33, 234) and radius 11 then Places a yellow line segment connecting (323, 181) to (363, 169).
; PLAN: r0=348(x), r1=105(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=234(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=323(x1), r11=181(y1), r12=363(x2), r13=169(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 105
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 33
LDI r6, 234
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 323
LDI r11, 181
LDI r12, 363
LDI r13, 169
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
