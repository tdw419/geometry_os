; DESCRIPTION: Places a white circle of radius 48 at center (145, 199).
; PLAN: r0=145(x), r1=199(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 199
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
