; DESCRIPTION: Places a green circle of radius 61 at center (421, 180).
; PLAN: r0=421(x), r1=180(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 180
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
