; DESCRIPTION: Places a cyan circle of radius 64 at center (144, 165).
; PLAN: r0=144(x), r1=165(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 165
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
