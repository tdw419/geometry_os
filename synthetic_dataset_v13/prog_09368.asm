; DESCRIPTION: Renders a black line between points (138, 63) and (49, 84).
; PLAN: r0=138(x1), r1=63(y1), r2=49(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 63
LDI r2, 49
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
