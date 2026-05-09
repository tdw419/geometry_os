; DESCRIPTION: Places a orange line segment connecting (42, 103) to (308, 102).
; PLAN: r0=42(x1), r1=103(y1), r2=308(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 103
LDI r2, 308
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
