; DESCRIPTION: Places a red line segment connecting (501, 245) to (329, 69).
; PLAN: r0=501(x1), r1=245(y1), r2=329(x2), r3=69(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 245
LDI r2, 329
LDI r3, 69
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
