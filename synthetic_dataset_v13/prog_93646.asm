; DESCRIPTION: Places a purple line segment connecting (312, 29) to (502, 130).
; PLAN: r0=312(x1), r1=29(y1), r2=502(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 29
LDI r2, 502
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
