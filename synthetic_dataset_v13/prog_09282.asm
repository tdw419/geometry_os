; DESCRIPTION: Composite: Renders a cyan disk with center (142, 100) and radius 31 then Sets a single cyan pixel at (260, 217) then Renders a white line between points (357, 79) and (315, 41).
; PLAN: r0=142(x), r1=100(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=260(x), r6=217(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=357(x1), r11=79(y1), r12=315(x2), r13=41(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 100
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 260
LDI r6, 217
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 357
LDI r11, 79
LDI r12, 315
LDI r13, 41
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
