; DESCRIPTION: Renders a blue line between points (329, 6) and (360, 62).
; PLAN: r0=329(x1), r1=6(y1), r2=360(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 6
LDI r2, 360
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
