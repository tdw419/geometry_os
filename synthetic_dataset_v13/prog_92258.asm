; DESCRIPTION: Draws a purple line from (331, 12) to (336, 187).
; PLAN: r0=331(x1), r1=12(y1), r2=336(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 12
LDI r2, 336
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
