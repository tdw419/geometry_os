; DESCRIPTION: Renders a purple line between points (401, 77) and (38, 153).
; PLAN: r0=401(x1), r1=77(y1), r2=38(x2), r3=153(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 77
LDI r2, 38
LDI r3, 153
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
