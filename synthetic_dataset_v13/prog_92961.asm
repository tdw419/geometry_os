; DESCRIPTION: Renders a black line between points (503, 178) and (37, 11).
; PLAN: r0=503(x1), r1=178(y1), r2=37(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 178
LDI r2, 37
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
