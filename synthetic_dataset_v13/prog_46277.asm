; DESCRIPTION: Places a blue line segment connecting (376, 13) to (173, 156).
; PLAN: r0=376(x1), r1=13(y1), r2=173(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 13
LDI r2, 173
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
