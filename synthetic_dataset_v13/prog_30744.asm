; DESCRIPTION: Places a orange line segment connecting (198, 100) to (81, 171).
; PLAN: r0=198(x1), r1=100(y1), r2=81(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 100
LDI r2, 81
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
