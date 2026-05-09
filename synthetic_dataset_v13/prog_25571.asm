; DESCRIPTION: Places a green circle of radius 39 at center (55, 82).
; PLAN: r0=55(x), r1=82(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 82
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
