; DESCRIPTION: Places a cyan circle of radius 28 at center (354, 136).
; PLAN: r0=354(x), r1=136(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 136
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
