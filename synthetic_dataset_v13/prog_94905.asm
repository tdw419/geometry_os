; DESCRIPTION: Places a orange line segment connecting (168, 41) to (394, 3).
; PLAN: r0=168(x1), r1=41(y1), r2=394(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 41
LDI r2, 394
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
