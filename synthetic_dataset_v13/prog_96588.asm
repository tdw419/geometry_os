; DESCRIPTION: Places a orange line segment connecting (354, 74) to (138, 26).
; PLAN: r0=354(x1), r1=74(y1), r2=138(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 74
LDI r2, 138
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
