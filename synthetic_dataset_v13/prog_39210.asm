; DESCRIPTION: Composite: Sets a single green pixel at (288, 124) then Renders a black line between points (415, 156) and (183, 71) then Renders a black disk with center (392, 141) and radius 80.
; PLAN: r0=288(x), r1=124(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=415(x1), r6=156(y1), r7=183(x2), r8=71(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=392(x), r11=141(y), r12=80(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 288
LDI r1, 124
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 415
LDI r6, 156
LDI r7, 183
LDI r8, 71
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 392
LDI r11, 141
LDI r12, 80
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
