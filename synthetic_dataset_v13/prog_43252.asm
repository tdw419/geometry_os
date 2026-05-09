; DESCRIPTION: Places a orange line segment connecting (14, 103) to (436, 166).
; PLAN: r0=14(x1), r1=103(y1), r2=436(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 103
LDI r2, 436
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
