; DESCRIPTION: Places a white circle of radius 54 at center (64, 163).
; PLAN: r0=64(x), r1=163(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 163
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
