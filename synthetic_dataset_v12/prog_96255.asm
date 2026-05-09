; DESCRIPTION: Places a cyan circle of radius 66 at center (395, 156).
; PLAN: r0=395(x), r1=156(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 156
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
