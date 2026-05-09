; DESCRIPTION: Renders a purple line between points (74, 13) and (223, 54).
; PLAN: r0=74(x1), r1=13(y1), r2=223(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 13
LDI r2, 223
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
