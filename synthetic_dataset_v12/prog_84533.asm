; DESCRIPTION: Renders a black line between points (254, 174) and (219, 11).
; PLAN: r0=254(x1), r1=174(y1), r2=219(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 174
LDI r2, 219
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
