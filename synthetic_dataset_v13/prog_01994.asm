; DESCRIPTION: Draws a purple line from (508, 242) to (234, 176).
; PLAN: r0=508(x1), r1=242(y1), r2=234(x2), r3=176(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 242
LDI r2, 234
LDI r3, 176
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
