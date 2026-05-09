; DESCRIPTION: Places a orange line segment connecting (126, 103) to (151, 140).
; PLAN: r0=126(x1), r1=103(y1), r2=151(x2), r3=140(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 103
LDI r2, 151
LDI r3, 140
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
