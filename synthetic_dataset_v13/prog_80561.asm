; DESCRIPTION: Renders a purple line between points (426, 150) and (252, 61).
; PLAN: r0=426(x1), r1=150(y1), r2=252(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 150
LDI r2, 252
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
