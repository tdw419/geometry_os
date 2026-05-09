; DESCRIPTION: Places a orange line segment connecting (333, 60) to (239, 128).
; PLAN: r0=333(x1), r1=60(y1), r2=239(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 60
LDI r2, 239
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
