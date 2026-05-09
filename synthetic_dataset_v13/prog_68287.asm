; DESCRIPTION: Draws a red line from (331, 237) to (323, 208).
; PLAN: r0=331(x1), r1=237(y1), r2=323(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 237
LDI r2, 323
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
