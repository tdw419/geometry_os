; DESCRIPTION: Renders a purple line between points (66, 9) and (504, 37).
; PLAN: r0=66(x1), r1=9(y1), r2=504(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 9
LDI r2, 504
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
