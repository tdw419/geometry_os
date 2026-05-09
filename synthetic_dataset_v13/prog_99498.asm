; DESCRIPTION: Places a green circle of radius 12 at center (28, 82).
; PLAN: r0=28(x), r1=82(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 82
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
