; DESCRIPTION: Draws a purple line from (124, 180) to (129, 45).
; PLAN: r0=124(x1), r1=180(y1), r2=129(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 180
LDI r2, 129
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
