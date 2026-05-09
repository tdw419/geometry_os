; DESCRIPTION: Renders a purple line between points (401, 145) and (219, 41).
; PLAN: r0=401(x1), r1=145(y1), r2=219(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 145
LDI r2, 219
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
