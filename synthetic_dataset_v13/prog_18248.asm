; DESCRIPTION: Places a orange line segment connecting (28, 188) to (337, 42).
; PLAN: r0=28(x1), r1=188(y1), r2=337(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 188
LDI r2, 337
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
