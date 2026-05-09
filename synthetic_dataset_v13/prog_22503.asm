; DESCRIPTION: Places a orange line segment connecting (126, 171) to (186, 227).
; PLAN: r0=126(x1), r1=171(y1), r2=186(x2), r3=227(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 171
LDI r2, 186
LDI r3, 227
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
