; DESCRIPTION: Renders a blue line between points (120, 20) and (211, 40).
; PLAN: r0=120(x1), r1=20(y1), r2=211(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 20
LDI r2, 211
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
