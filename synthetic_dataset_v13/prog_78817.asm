; DESCRIPTION: Renders a black line between points (338, 64) and (232, 9).
; PLAN: r0=338(x1), r1=64(y1), r2=232(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 64
LDI r2, 232
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
