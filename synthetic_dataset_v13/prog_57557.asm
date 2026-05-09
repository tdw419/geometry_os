; DESCRIPTION: Places a cyan circle of radius 43 at center (189, 67).
; PLAN: r0=189(x), r1=67(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 67
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
