; DESCRIPTION: Draws a white line from (496, 64) to (219, 218).
; PLAN: r0=496(x1), r1=64(y1), r2=219(x2), r3=218(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 64
LDI r2, 219
LDI r3, 218
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
