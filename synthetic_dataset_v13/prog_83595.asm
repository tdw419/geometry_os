; DESCRIPTION: Places a orange line segment connecting (263, 44) to (511, 191).
; PLAN: r0=263(x1), r1=44(y1), r2=511(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 44
LDI r2, 511
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
