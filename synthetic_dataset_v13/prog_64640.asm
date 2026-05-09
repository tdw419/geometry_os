; DESCRIPTION: Renders a black line between points (60, 6) and (181, 250).
; PLAN: r0=60(x1), r1=6(y1), r2=181(x2), r3=250(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 6
LDI r2, 181
LDI r3, 250
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
