; DESCRIPTION: Places a cyan circle of radius 22 at center (414, 188).
; PLAN: r0=414(x), r1=188(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 188
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
