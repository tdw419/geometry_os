; DESCRIPTION: Places a orange line segment connecting (234, 164) to (206, 0).
; PLAN: r0=234(x1), r1=164(y1), r2=206(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 164
LDI r2, 206
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
