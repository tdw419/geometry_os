; DESCRIPTION: Composite: Places a white line segment connecting (438, 222) to (50, 121) then Sets a single cyan pixel at (414, 185).
; PLAN: r0=438(x1), r1=222(y1), r2=50(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=185(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 438
LDI r1, 222
LDI r2, 50
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 185
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
