; DESCRIPTION: Places a orange line segment connecting (423, 208) to (509, 103).
; PLAN: r0=423(x1), r1=208(y1), r2=509(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 208
LDI r2, 509
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
