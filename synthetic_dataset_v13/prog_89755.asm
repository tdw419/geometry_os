; DESCRIPTION: Renders a purple line between points (489, 97) and (281, 223).
; PLAN: r0=489(x1), r1=97(y1), r2=281(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 97
LDI r2, 281
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
