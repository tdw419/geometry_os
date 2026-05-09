; DESCRIPTION: Places a cyan circle of radius 32 at center (318, 191).
; PLAN: r0=318(x), r1=191(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 191
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
