; DESCRIPTION: Places a orange line segment connecting (510, 80) to (233, 134).
; PLAN: r0=510(x1), r1=80(y1), r2=233(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 80
LDI r2, 233
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
