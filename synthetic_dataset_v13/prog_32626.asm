; DESCRIPTION: Places a blue line segment connecting (223, 229) to (184, 250).
; PLAN: r0=223(x1), r1=229(y1), r2=184(x2), r3=250(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 229
LDI r2, 184
LDI r3, 250
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
