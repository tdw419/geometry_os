; DESCRIPTION: Places a blue line segment connecting (103, 170) to (464, 8).
; PLAN: r0=103(x1), r1=170(y1), r2=464(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 170
LDI r2, 464
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
