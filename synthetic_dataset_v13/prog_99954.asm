; DESCRIPTION: Places a cyan circle of radius 34 at center (354, 205).
; PLAN: r0=354(x), r1=205(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 205
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
