; DESCRIPTION: Places a blue line segment connecting (27, 184) to (241, 62).
; PLAN: r0=27(x1), r1=184(y1), r2=241(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 184
LDI r2, 241
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
