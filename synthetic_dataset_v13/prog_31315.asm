; DESCRIPTION: Places a cyan circle of radius 39 at center (437, 140).
; PLAN: r0=437(x), r1=140(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 140
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
