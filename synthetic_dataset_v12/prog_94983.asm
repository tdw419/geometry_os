; DESCRIPTION: Places a cyan circle of radius 62 at center (175, 156).
; PLAN: r0=175(x), r1=156(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 156
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
