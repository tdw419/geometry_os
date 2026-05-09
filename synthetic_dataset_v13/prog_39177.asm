; DESCRIPTION: Renders a white line between points (134, 110) and (218, 136).
; PLAN: r0=134(x1), r1=110(y1), r2=218(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 110
LDI r2, 218
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
