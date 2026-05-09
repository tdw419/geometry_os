; DESCRIPTION: Places a orange line segment connecting (156, 237) to (373, 32).
; PLAN: r0=156(x1), r1=237(y1), r2=373(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 237
LDI r2, 373
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
