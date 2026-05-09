; DESCRIPTION: Places a cyan circle of radius 13 at center (309, 53).
; PLAN: r0=309(x), r1=53(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 53
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
