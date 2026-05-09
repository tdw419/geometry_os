; DESCRIPTION: Places a blue line segment connecting (184, 24) to (255, 55).
; PLAN: r0=184(x1), r1=24(y1), r2=255(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 24
LDI r2, 255
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
