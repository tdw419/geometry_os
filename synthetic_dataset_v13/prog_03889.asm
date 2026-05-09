; DESCRIPTION: Renders a black line between points (106, 9) and (21, 179).
; PLAN: r0=106(x1), r1=9(y1), r2=21(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 9
LDI r2, 21
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
