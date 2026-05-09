; DESCRIPTION: Renders a purple line between points (87, 162) and (308, 116).
; PLAN: r0=87(x1), r1=162(y1), r2=308(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 162
LDI r2, 308
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
