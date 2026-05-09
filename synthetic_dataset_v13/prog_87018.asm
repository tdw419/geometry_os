; DESCRIPTION: Places a green line segment connecting (200, 85) to (450, 76).
; PLAN: r0=200(x1), r1=85(y1), r2=450(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 85
LDI r2, 450
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
