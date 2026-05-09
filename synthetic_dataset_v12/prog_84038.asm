; DESCRIPTION: Renders a black line between points (13, 172) and (89, 132).
; PLAN: r0=13(x1), r1=172(y1), r2=89(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 172
LDI r2, 89
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
