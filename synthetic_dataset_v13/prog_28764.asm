; DESCRIPTION: Places a yellow line segment connecting (429, 239) to (381, 128).
; PLAN: r0=429(x1), r1=239(y1), r2=381(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 239
LDI r2, 381
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
