; DESCRIPTION: Places a orange line segment connecting (165, 231) to (30, 117).
; PLAN: r0=165(x1), r1=231(y1), r2=30(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 231
LDI r2, 30
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
