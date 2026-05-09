; DESCRIPTION: Renders a magenta line between points (339, 89) and (237, 200).
; PLAN: r0=339(x1), r1=89(y1), r2=237(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 89
LDI r2, 237
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
