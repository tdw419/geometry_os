; DESCRIPTION: Renders a blue line between points (126, 87) and (473, 252).
; PLAN: r0=126(x1), r1=87(y1), r2=473(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 87
LDI r2, 473
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
