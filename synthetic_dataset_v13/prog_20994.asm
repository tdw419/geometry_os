; DESCRIPTION: Renders a black line between points (196, 106) and (130, 6).
; PLAN: r0=196(x1), r1=106(y1), r2=130(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 106
LDI r2, 130
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
