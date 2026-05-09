; DESCRIPTION: Places a cyan circle of radius 73 at center (87, 183).
; PLAN: r0=87(x), r1=183(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 183
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
