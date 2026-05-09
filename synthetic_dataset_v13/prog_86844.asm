; DESCRIPTION: Places a blue line segment connecting (464, 75) to (27, 181).
; PLAN: r0=464(x1), r1=75(y1), r2=27(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 75
LDI r2, 27
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
