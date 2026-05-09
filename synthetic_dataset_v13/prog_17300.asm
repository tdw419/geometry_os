; DESCRIPTION: Places a orange line segment connecting (79, 140) to (511, 192).
; PLAN: r0=79(x1), r1=140(y1), r2=511(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 140
LDI r2, 511
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
