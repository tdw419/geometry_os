; DESCRIPTION: Places a green line segment connecting (8, 200) to (69, 50).
; PLAN: r0=8(x1), r1=200(y1), r2=69(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 200
LDI r2, 69
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
