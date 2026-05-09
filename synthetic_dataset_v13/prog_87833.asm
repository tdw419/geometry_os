; DESCRIPTION: Renders a purple line between points (361, 168) and (4, 117).
; PLAN: r0=361(x1), r1=168(y1), r2=4(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 168
LDI r2, 4
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
