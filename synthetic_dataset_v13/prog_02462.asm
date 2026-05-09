; DESCRIPTION: Renders a black line between points (52, 80) and (496, 229).
; PLAN: r0=52(x1), r1=80(y1), r2=496(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 80
LDI r2, 496
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
