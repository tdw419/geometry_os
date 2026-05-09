; DESCRIPTION: Places a orange line segment connecting (30, 146) to (1, 171).
; PLAN: r0=30(x1), r1=146(y1), r2=1(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 146
LDI r2, 1
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
