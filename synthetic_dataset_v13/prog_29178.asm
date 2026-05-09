; DESCRIPTION: Renders a black line between points (89, 104) and (74, 50).
; PLAN: r0=89(x1), r1=104(y1), r2=74(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 104
LDI r2, 74
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
