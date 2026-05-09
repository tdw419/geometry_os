; DESCRIPTION: Places a orange line segment connecting (392, 171) to (311, 21).
; PLAN: r0=392(x1), r1=171(y1), r2=311(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 171
LDI r2, 311
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
