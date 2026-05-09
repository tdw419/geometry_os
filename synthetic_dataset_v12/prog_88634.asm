; DESCRIPTION: Renders a blue line between points (187, 139) and (439, 78).
; PLAN: r0=187(x1), r1=139(y1), r2=439(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 139
LDI r2, 439
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
