; DESCRIPTION: Places a cyan circle of radius 62 at center (283, 140).
; PLAN: r0=283(x), r1=140(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 140
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
