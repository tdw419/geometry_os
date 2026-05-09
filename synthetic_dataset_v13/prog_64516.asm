; DESCRIPTION: Places a white circle of radius 79 at center (86, 144).
; PLAN: r0=86(x), r1=144(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 144
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
