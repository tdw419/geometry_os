; DESCRIPTION: Places a cyan circle of radius 11 at center (190, 242).
; PLAN: r0=190(x), r1=242(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 242
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
