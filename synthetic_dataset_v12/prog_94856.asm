; DESCRIPTION: Places a orange line segment connecting (193, 171) to (470, 131).
; PLAN: r0=193(x1), r1=171(y1), r2=470(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 171
LDI r2, 470
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
