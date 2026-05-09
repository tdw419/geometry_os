; DESCRIPTION: Renders a purple line between points (472, 54) and (187, 68).
; PLAN: r0=472(x1), r1=54(y1), r2=187(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 54
LDI r2, 187
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
