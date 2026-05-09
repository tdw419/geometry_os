; DESCRIPTION: Renders a purple line between points (401, 146) and (56, 80).
; PLAN: r0=401(x1), r1=146(y1), r2=56(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 146
LDI r2, 56
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
