; DESCRIPTION: Places a orange line segment connecting (111, 42) to (258, 90).
; PLAN: r0=111(x1), r1=42(y1), r2=258(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 42
LDI r2, 258
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
