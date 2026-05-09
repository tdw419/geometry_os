; DESCRIPTION: Renders a black line between points (332, 252) and (359, 240).
; PLAN: r0=332(x1), r1=252(y1), r2=359(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 252
LDI r2, 359
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
