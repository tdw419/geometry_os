; DESCRIPTION: Renders a white line between points (312, 10) and (315, 250).
; PLAN: r0=312(x1), r1=10(y1), r2=315(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 10
LDI r2, 315
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
