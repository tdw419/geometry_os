; DESCRIPTION: Places a red line segment connecting (501, 67) to (258, 233).
; PLAN: r0=501(x1), r1=67(y1), r2=258(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 67
LDI r2, 258
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
