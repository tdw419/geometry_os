; DESCRIPTION: Renders a black line between points (25, 57) and (178, 104).
; PLAN: r0=25(x1), r1=57(y1), r2=178(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 57
LDI r2, 178
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
