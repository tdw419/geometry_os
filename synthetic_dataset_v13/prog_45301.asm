; DESCRIPTION: Renders a black line between points (35, 95) and (503, 21).
; PLAN: r0=35(x1), r1=95(y1), r2=503(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 95
LDI r2, 503
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
