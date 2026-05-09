; DESCRIPTION: Renders a purple line between points (260, 22) and (331, 172).
; PLAN: r0=260(x1), r1=22(y1), r2=331(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 22
LDI r2, 331
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
