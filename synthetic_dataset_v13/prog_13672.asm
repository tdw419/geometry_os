; DESCRIPTION: Places a orange line segment connecting (415, 69) to (286, 176).
; PLAN: r0=415(x1), r1=69(y1), r2=286(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 69
LDI r2, 286
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
