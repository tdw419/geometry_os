; DESCRIPTION: Places a white line segment connecting (393, 50) to (62, 123).
; PLAN: r0=393(x1), r1=50(y1), r2=62(x2), r3=123(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 50
LDI r2, 62
LDI r3, 123
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
