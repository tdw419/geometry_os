; DESCRIPTION: Renders a blue line between points (496, 99) and (260, 19).
; PLAN: r0=496(x1), r1=99(y1), r2=260(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 99
LDI r2, 260
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
