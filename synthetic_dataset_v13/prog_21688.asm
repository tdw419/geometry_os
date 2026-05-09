; DESCRIPTION: Places a cyan circle of radius 39 at center (329, 128).
; PLAN: r0=329(x), r1=128(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 128
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
