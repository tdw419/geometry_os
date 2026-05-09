; DESCRIPTION: Renders a white line between points (484, 1) and (83, 39).
; PLAN: r0=484(x1), r1=1(y1), r2=83(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 1
LDI r2, 83
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
