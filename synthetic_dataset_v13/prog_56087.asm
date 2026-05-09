; DESCRIPTION: Places a black circle of radius 33 at center (82, 205).
; PLAN: r0=82(x), r1=205(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 205
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
