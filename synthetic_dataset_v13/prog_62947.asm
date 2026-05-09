; DESCRIPTION: Renders a purple line between points (182, 70) and (11, 120).
; PLAN: r0=182(x1), r1=70(y1), r2=11(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 70
LDI r2, 11
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
