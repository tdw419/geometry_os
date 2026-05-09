; DESCRIPTION: Places a orange line segment connecting (101, 107) to (228, 216).
; PLAN: r0=101(x1), r1=107(y1), r2=228(x2), r3=216(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 107
LDI r2, 228
LDI r3, 216
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
