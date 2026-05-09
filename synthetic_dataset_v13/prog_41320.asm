; DESCRIPTION: Places a orange line segment connecting (216, 74) to (7, 171).
; PLAN: r0=216(x1), r1=74(y1), r2=7(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 74
LDI r2, 7
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
