; DESCRIPTION: Renders a purple line between points (372, 52) and (340, 22).
; PLAN: r0=372(x1), r1=52(y1), r2=340(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 52
LDI r2, 340
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
