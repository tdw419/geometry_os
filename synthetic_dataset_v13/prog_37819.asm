; DESCRIPTION: Places a cyan circle of radius 62 at center (190, 126).
; PLAN: r0=190(x), r1=126(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 126
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
