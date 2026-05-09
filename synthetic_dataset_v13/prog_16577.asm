; DESCRIPTION: Places a blue line segment connecting (440, 82) to (188, 2).
; PLAN: r0=440(x1), r1=82(y1), r2=188(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 82
LDI r2, 188
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
