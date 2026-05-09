; DESCRIPTION: Places a cyan circle of radius 39 at center (326, 129).
; PLAN: r0=326(x), r1=129(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 129
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
