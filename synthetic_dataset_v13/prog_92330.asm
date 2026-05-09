; DESCRIPTION: Renders a purple line between points (504, 222) and (249, 89).
; PLAN: r0=504(x1), r1=222(y1), r2=249(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 222
LDI r2, 249
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
