; DESCRIPTION: Places a red circle of radius 21 at center (331, 100).
; PLAN: r0=331(x), r1=100(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 331
LDI r1, 100
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
