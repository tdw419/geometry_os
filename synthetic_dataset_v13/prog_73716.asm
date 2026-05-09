; DESCRIPTION: Places a orange line segment connecting (202, 28) to (101, 45).
; PLAN: r0=202(x1), r1=28(y1), r2=101(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 28
LDI r2, 101
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
