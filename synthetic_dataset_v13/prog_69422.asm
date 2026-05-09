; DESCRIPTION: Places a orange line segment connecting (176, 250) to (330, 128).
; PLAN: r0=176(x1), r1=250(y1), r2=330(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 250
LDI r2, 330
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
