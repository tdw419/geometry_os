; DESCRIPTION: Renders a blue line between points (474, 35) and (342, 70).
; PLAN: r0=474(x1), r1=35(y1), r2=342(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 35
LDI r2, 342
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
