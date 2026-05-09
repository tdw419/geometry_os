; DESCRIPTION: Places a cyan circle of radius 48 at center (139, 163).
; PLAN: r0=139(x), r1=163(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 163
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
