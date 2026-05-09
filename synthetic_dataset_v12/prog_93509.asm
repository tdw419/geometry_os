; DESCRIPTION: Places a orange line segment connecting (169, 7) to (396, 42).
; PLAN: r0=169(x1), r1=7(y1), r2=396(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 7
LDI r2, 396
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
