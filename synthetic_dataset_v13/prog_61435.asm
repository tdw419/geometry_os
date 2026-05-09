; DESCRIPTION: Renders a purple line between points (387, 85) and (171, 112).
; PLAN: r0=387(x1), r1=85(y1), r2=171(x2), r3=112(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 85
LDI r2, 171
LDI r3, 112
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
