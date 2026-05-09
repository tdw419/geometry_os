; DESCRIPTION: Places a orange line segment connecting (126, 120) to (134, 198).
; PLAN: r0=126(x1), r1=120(y1), r2=134(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 120
LDI r2, 134
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
