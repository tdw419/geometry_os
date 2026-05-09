; DESCRIPTION: Renders a blue line between points (175, 62) and (50, 120).
; PLAN: r0=175(x1), r1=62(y1), r2=50(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 62
LDI r2, 50
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
