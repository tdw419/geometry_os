; DESCRIPTION: Places a orange line segment connecting (22, 254) to (211, 42).
; PLAN: r0=22(x1), r1=254(y1), r2=211(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 254
LDI r2, 211
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
