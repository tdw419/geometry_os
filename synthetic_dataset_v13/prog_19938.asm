; DESCRIPTION: Draws a purple line from (290, 241) to (29, 159).
; PLAN: r0=290(x1), r1=241(y1), r2=29(x2), r3=159(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 241
LDI r2, 29
LDI r3, 159
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
