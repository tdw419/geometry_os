; DESCRIPTION: Renders a black line between points (400, 94) and (364, 157).
; PLAN: r0=400(x1), r1=94(y1), r2=364(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 94
LDI r2, 364
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
