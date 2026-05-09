; DESCRIPTION: Places a orange line segment connecting (487, 183) to (64, 90).
; PLAN: r0=487(x1), r1=183(y1), r2=64(x2), r3=90(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 183
LDI r2, 64
LDI r3, 90
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
