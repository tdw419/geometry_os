; DESCRIPTION: Places a orange line segment connecting (330, 244) to (114, 255).
; PLAN: r0=330(x1), r1=244(y1), r2=114(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 244
LDI r2, 114
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
