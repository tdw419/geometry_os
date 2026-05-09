; DESCRIPTION: Renders a black line between points (511, 109) and (63, 66).
; PLAN: r0=511(x1), r1=109(y1), r2=63(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 109
LDI r2, 63
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
