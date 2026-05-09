; DESCRIPTION: Places a cyan circle of radius 72 at center (84, 140).
; PLAN: r0=84(x), r1=140(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 140
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
