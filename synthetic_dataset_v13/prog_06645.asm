; DESCRIPTION: Places a orange line segment connecting (210, 141) to (57, 6).
; PLAN: r0=210(x1), r1=141(y1), r2=57(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 141
LDI r2, 57
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
