; DESCRIPTION: Places a white line segment connecting (375, 50) to (258, 14).
; PLAN: r0=375(x1), r1=50(y1), r2=258(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 50
LDI r2, 258
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
