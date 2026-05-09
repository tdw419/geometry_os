; DESCRIPTION: Renders a purple line between points (116, 50) and (199, 23).
; PLAN: r0=116(x1), r1=50(y1), r2=199(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 50
LDI r2, 199
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
