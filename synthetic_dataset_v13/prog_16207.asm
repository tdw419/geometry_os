; DESCRIPTION: Renders a black line between points (77, 213) and (311, 22).
; PLAN: r0=77(x1), r1=213(y1), r2=311(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 213
LDI r2, 311
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
