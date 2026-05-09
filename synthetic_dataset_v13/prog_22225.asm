; DESCRIPTION: Places a orange line segment connecting (208, 66) to (412, 174).
; PLAN: r0=208(x1), r1=66(y1), r2=412(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 66
LDI r2, 412
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
