; DESCRIPTION: Places a blue line segment connecting (311, 76) to (113, 126).
; PLAN: r0=311(x1), r1=76(y1), r2=113(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 76
LDI r2, 113
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
