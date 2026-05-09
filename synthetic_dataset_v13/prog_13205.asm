; DESCRIPTION: Places a blue line segment connecting (302, 174) to (307, 24).
; PLAN: r0=302(x1), r1=174(y1), r2=307(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 174
LDI r2, 307
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
