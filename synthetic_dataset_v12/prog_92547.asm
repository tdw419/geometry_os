; DESCRIPTION: Places a orange line segment connecting (140, 108) to (280, 195).
; PLAN: r0=140(x1), r1=108(y1), r2=280(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 108
LDI r2, 280
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
