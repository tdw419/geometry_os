; DESCRIPTION: Renders a purple line between points (81, 5) and (398, 233).
; PLAN: r0=81(x1), r1=5(y1), r2=398(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 5
LDI r2, 398
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
