; DESCRIPTION: Places a cyan circle of radius 26 at center (179, 109).
; PLAN: r0=179(x), r1=109(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 109
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
