; DESCRIPTION: Places a orange line segment connecting (375, 32) to (307, 175).
; PLAN: r0=375(x1), r1=32(y1), r2=307(x2), r3=175(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 32
LDI r2, 307
LDI r3, 175
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
