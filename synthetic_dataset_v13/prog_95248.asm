; DESCRIPTION: Renders a black line between points (343, 65) and (33, 9).
; PLAN: r0=343(x1), r1=65(y1), r2=33(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 65
LDI r2, 33
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
