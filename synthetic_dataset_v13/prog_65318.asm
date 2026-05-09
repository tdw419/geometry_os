; DESCRIPTION: Places a cyan circle of radius 78 at center (373, 82).
; PLAN: r0=373(x), r1=82(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 82
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
