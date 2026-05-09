; DESCRIPTION: Places a white line segment connecting (359, 154) to (5, 22).
; PLAN: r0=359(x1), r1=154(y1), r2=5(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 154
LDI r2, 5
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
