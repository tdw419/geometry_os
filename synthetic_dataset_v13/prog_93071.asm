; DESCRIPTION: Places a orange line segment connecting (35, 176) to (206, 225).
; PLAN: r0=35(x1), r1=176(y1), r2=206(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 176
LDI r2, 206
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
