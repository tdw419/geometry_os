; DESCRIPTION: Places a orange line segment connecting (209, 128) to (157, 86).
; PLAN: r0=209(x1), r1=128(y1), r2=157(x2), r3=86(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 128
LDI r2, 157
LDI r3, 86
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
