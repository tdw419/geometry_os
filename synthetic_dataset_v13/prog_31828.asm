; DESCRIPTION: Places a blue line segment connecting (50, 149) to (207, 11).
; PLAN: r0=50(x1), r1=149(y1), r2=207(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 149
LDI r2, 207
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
