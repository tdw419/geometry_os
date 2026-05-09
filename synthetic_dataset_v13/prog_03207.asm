; DESCRIPTION: Places a orange line segment connecting (361, 180) to (168, 49).
; PLAN: r0=361(x1), r1=180(y1), r2=168(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 180
LDI r2, 168
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
