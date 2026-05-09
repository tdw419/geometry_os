; DESCRIPTION: Places a orange circle of radius 73 at center (84, 95).
; PLAN: r0=84(x), r1=95(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 95
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
