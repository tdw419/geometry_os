; DESCRIPTION: Renders a black line between points (15, 124) and (1, 205).
; PLAN: r0=15(x1), r1=124(y1), r2=1(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 124
LDI r2, 1
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
