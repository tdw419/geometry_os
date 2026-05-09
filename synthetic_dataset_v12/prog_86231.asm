; DESCRIPTION: Places a blue line segment connecting (439, 184) to (29, 184).
; PLAN: r0=439(x1), r1=184(y1), r2=29(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 184
LDI r2, 29
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
