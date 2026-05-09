; DESCRIPTION: Renders a black line between points (179, 252) and (205, 23).
; PLAN: r0=179(x1), r1=252(y1), r2=205(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 252
LDI r2, 205
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
