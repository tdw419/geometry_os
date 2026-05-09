; DESCRIPTION: Composite: Places a black line segment connecting (284, 169) to (318, 174) then Sets a single cyan pixel at (252, 79).
; PLAN: r0=284(x1), r1=169(y1), r2=318(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=79(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 284
LDI r1, 169
LDI r2, 318
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 79
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
