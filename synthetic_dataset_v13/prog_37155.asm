; DESCRIPTION: Renders a blue line between points (360, 16) and (285, 66).
; PLAN: r0=360(x1), r1=16(y1), r2=285(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 16
LDI r2, 285
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
