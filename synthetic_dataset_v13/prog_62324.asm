; DESCRIPTION: Composite: Renders a red line between points (179, 45) and (331, 249) then Sets a single cyan pixel at (424, 44).
; PLAN: r0=179(x1), r1=45(y1), r2=331(x2), r3=249(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=44(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 179
LDI r1, 45
LDI r2, 331
LDI r3, 249
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 44
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
