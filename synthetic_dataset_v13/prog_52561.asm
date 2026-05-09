; DESCRIPTION: Renders a blue line between points (456, 86) and (10, 1).
; PLAN: r0=456(x1), r1=86(y1), r2=10(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 86
LDI r2, 10
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
