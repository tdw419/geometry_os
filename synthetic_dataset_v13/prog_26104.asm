; DESCRIPTION: Creates a cyan circular shape at (363, 212) with radius 43.
; PLAN: r0=363(x), r1=212(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 212
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
