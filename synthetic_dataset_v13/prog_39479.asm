; DESCRIPTION: Renders a green line between points (435, 55) and (179, 185).
; PLAN: r0=435(x1), r1=55(y1), r2=179(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 55
LDI r2, 179
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
