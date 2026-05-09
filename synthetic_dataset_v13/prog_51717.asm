; DESCRIPTION: Places a green circle of radius 30 at center (100, 100).
; PLAN: r0=100(x), r1=100(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 100
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
