; DESCRIPTION: Renders a black line between points (492, 218) and (252, 251).
; PLAN: r0=492(x1), r1=218(y1), r2=252(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 218
LDI r2, 252
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
