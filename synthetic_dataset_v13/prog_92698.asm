; DESCRIPTION: Places a cyan circle of radius 57 at center (156, 77).
; PLAN: r0=156(x), r1=77(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 77
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
