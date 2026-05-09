; DESCRIPTION: Places a orange line segment connecting (194, 243) to (455, 45).
; PLAN: r0=194(x1), r1=243(y1), r2=455(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 243
LDI r2, 455
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
