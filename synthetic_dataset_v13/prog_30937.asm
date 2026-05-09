; DESCRIPTION: Places a green line segment connecting (69, 232) to (377, 50).
; PLAN: r0=69(x1), r1=232(y1), r2=377(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 232
LDI r2, 377
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
