; DESCRIPTION: Draws a black line from (432, 186) to (325, 176).
; PLAN: r0=432(x1), r1=186(y1), r2=325(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 186
LDI r2, 325
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
