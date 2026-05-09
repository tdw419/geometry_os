; DESCRIPTION: Renders a black line between points (355, 104) and (344, 149).
; PLAN: r0=355(x1), r1=104(y1), r2=344(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 104
LDI r2, 344
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
