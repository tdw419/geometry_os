; DESCRIPTION: Renders a white line between points (96, 188) and (454, 9).
; PLAN: r0=96(x1), r1=188(y1), r2=454(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 188
LDI r2, 454
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
