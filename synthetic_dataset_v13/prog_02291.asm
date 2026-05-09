; DESCRIPTION: Renders a magenta line between points (419, 244) and (314, 186).
; PLAN: r0=419(x1), r1=244(y1), r2=314(x2), r3=186(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 244
LDI r2, 314
LDI r3, 186
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
