; DESCRIPTION: Places a cyan circle of radius 23 at center (435, 128).
; PLAN: r0=435(x), r1=128(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 128
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
