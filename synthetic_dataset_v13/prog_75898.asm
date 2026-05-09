; DESCRIPTION: Places a orange line segment connecting (171, 103) to (70, 244).
; PLAN: r0=171(x1), r1=103(y1), r2=70(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 103
LDI r2, 70
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
