; DESCRIPTION: Places a orange line segment connecting (234, 94) to (171, 174).
; PLAN: r0=234(x1), r1=94(y1), r2=171(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 94
LDI r2, 171
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
