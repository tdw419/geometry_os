; DESCRIPTION: Places a cyan circle of radius 76 at center (424, 82).
; PLAN: r0=424(x), r1=82(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 82
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
