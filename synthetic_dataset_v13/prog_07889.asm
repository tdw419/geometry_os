; DESCRIPTION: Places a orange line segment connecting (419, 197) to (55, 146).
; PLAN: r0=419(x1), r1=197(y1), r2=55(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 197
LDI r2, 55
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
