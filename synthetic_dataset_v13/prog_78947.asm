; DESCRIPTION: Renders a purple line between points (429, 113) and (262, 129).
; PLAN: r0=429(x1), r1=113(y1), r2=262(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 113
LDI r2, 262
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
