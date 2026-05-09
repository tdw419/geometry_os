; DESCRIPTION: Renders a blue line between points (42, 84) and (20, 80).
; PLAN: r0=42(x1), r1=84(y1), r2=20(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 84
LDI r2, 20
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
