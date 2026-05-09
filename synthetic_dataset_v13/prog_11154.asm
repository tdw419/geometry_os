; DESCRIPTION: Places a cyan circle of radius 49 at center (204, 195).
; PLAN: r0=204(x), r1=195(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 195
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
