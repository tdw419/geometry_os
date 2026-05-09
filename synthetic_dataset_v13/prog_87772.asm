; DESCRIPTION: Places a cyan circle of radius 46 at center (67, 128).
; PLAN: r0=67(x), r1=128(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 128
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
