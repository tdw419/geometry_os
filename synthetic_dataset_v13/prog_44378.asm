; DESCRIPTION: Places a cyan circle of radius 73 at center (156, 89).
; PLAN: r0=156(x), r1=89(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 89
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
