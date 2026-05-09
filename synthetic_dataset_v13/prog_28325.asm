; DESCRIPTION: Renders a yellow line between points (409, 56) and (353, 51).
; PLAN: r0=409(x1), r1=56(y1), r2=353(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 56
LDI r2, 353
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
