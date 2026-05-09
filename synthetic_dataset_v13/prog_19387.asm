; DESCRIPTION: Renders a black line between points (98, 104) and (12, 25).
; PLAN: r0=98(x1), r1=104(y1), r2=12(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 104
LDI r2, 12
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
