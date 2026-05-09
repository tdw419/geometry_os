; DESCRIPTION: Places a cyan circle of radius 20 at center (457, 128).
; PLAN: r0=457(x), r1=128(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 128
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
