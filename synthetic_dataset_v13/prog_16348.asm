; DESCRIPTION: Renders a purple line between points (279, 23) and (340, 2).
; PLAN: r0=279(x1), r1=23(y1), r2=340(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 23
LDI r2, 340
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
