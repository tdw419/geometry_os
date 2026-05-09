; DESCRIPTION: Places a orange line segment connecting (42, 49) to (9, 253).
; PLAN: r0=42(x1), r1=49(y1), r2=9(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 49
LDI r2, 9
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
