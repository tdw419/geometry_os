; DESCRIPTION: Places a blue line segment connecting (162, 163) to (187, 208).
; PLAN: r0=162(x1), r1=163(y1), r2=187(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 163
LDI r2, 187
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
