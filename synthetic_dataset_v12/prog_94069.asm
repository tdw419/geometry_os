; DESCRIPTION: Places a white circle of radius 79 at center (413, 128).
; PLAN: r0=413(x), r1=128(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 128
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
