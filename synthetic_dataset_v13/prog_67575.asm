; DESCRIPTION: Places a cyan circle of radius 19 at center (383, 109).
; PLAN: r0=383(x), r1=109(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 109
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
