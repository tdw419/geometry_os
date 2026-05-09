; DESCRIPTION: Places a white circle of radius 71 at center (75, 128).
; PLAN: r0=75(x), r1=128(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 128
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
