; DESCRIPTION: Renders a purple line between points (99, 152) and (475, 35).
; PLAN: r0=99(x1), r1=152(y1), r2=475(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 152
LDI r2, 475
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
