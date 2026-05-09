; DESCRIPTION: Places a orange line segment connecting (180, 163) to (101, 28).
; PLAN: r0=180(x1), r1=163(y1), r2=101(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 163
LDI r2, 101
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
