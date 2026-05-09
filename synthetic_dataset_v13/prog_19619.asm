; DESCRIPTION: Places a blue line segment connecting (168, 113) to (115, 79).
; PLAN: r0=168(x1), r1=113(y1), r2=115(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 113
LDI r2, 115
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
