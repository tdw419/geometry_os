; DESCRIPTION: Places a blue line segment connecting (166, 5) to (464, 118).
; PLAN: r0=166(x1), r1=5(y1), r2=464(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 5
LDI r2, 464
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
