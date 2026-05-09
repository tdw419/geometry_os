; DESCRIPTION: Renders a blue line between points (442, 233) and (375, 7).
; PLAN: r0=442(x1), r1=233(y1), r2=375(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 233
LDI r2, 375
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
