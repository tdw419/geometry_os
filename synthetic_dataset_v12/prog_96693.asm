; DESCRIPTION: Places a green line segment connecting (369, 149) to (282, 73).
; PLAN: r0=369(x1), r1=149(y1), r2=282(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 149
LDI r2, 282
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
