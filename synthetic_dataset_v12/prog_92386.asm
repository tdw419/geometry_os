; DESCRIPTION: Places a cyan circle of radius 37 at center (468, 134).
; PLAN: r0=468(x), r1=134(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 134
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
