; DESCRIPTION: Renders a black line between points (503, 23) and (261, 116).
; PLAN: r0=503(x1), r1=23(y1), r2=261(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 23
LDI r2, 261
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
