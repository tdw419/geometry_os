; DESCRIPTION: Places a orange line segment connecting (187, 93) to (67, 30).
; PLAN: r0=187(x1), r1=93(y1), r2=67(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 93
LDI r2, 67
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
