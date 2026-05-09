; DESCRIPTION: Renders a purple line between points (278, 159) and (30, 28).
; PLAN: r0=278(x1), r1=159(y1), r2=30(x2), r3=28(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 159
LDI r2, 30
LDI r3, 28
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
