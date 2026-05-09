; DESCRIPTION: Renders a purple line between points (344, 191) and (438, 229).
; PLAN: r0=344(x1), r1=191(y1), r2=438(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 191
LDI r2, 438
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
