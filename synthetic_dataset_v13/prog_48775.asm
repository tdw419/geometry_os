; DESCRIPTION: Draws a purple line from (41, 186) to (277, 208).
; PLAN: r0=41(x1), r1=186(y1), r2=277(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 186
LDI r2, 277
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
