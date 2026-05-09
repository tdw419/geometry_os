; DESCRIPTION: Places a blue line segment connecting (142, 171) to (309, 150).
; PLAN: r0=142(x1), r1=171(y1), r2=309(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 171
LDI r2, 309
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
