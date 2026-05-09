; DESCRIPTION: Places a white line segment connecting (50, 76) to (350, 36).
; PLAN: r0=50(x1), r1=76(y1), r2=350(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 76
LDI r2, 350
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
