; DESCRIPTION: Places a orange line segment connecting (60, 35) to (51, 146).
; PLAN: r0=60(x1), r1=35(y1), r2=51(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 35
LDI r2, 51
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
