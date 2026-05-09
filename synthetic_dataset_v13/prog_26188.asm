; DESCRIPTION: Renders a purple line between points (8, 114) and (193, 30).
; PLAN: r0=8(x1), r1=114(y1), r2=193(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 114
LDI r2, 193
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
