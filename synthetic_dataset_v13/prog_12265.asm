; DESCRIPTION: Renders a black line between points (503, 6) and (495, 251).
; PLAN: r0=503(x1), r1=6(y1), r2=495(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 6
LDI r2, 495
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
