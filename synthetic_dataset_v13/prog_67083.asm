; DESCRIPTION: Places a orange line segment connecting (223, 247) to (333, 15).
; PLAN: r0=223(x1), r1=247(y1), r2=333(x2), r3=15(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 247
LDI r2, 333
LDI r3, 15
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
