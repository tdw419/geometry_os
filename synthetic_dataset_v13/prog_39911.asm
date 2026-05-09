; DESCRIPTION: Places a orange line segment connecting (263, 66) to (239, 160).
; PLAN: r0=263(x1), r1=66(y1), r2=239(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 66
LDI r2, 239
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
