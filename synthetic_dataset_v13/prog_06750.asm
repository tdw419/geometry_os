; DESCRIPTION: Places a orange line segment connecting (239, 28) to (257, 218).
; PLAN: r0=239(x1), r1=28(y1), r2=257(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 28
LDI r2, 257
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
