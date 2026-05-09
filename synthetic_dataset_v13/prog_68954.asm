; DESCRIPTION: Renders a purple line between points (50, 2) and (51, 38).
; PLAN: r0=50(x1), r1=2(y1), r2=51(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 2
LDI r2, 51
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
