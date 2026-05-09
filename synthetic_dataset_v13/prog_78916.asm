; DESCRIPTION: Places a green circle of radius 15 at center (367, 28).
; PLAN: r0=367(x), r1=28(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 28
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
