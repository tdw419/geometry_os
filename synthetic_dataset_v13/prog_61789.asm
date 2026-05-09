; DESCRIPTION: Places a cyan circle of radius 26 at center (126, 44).
; PLAN: r0=126(x), r1=44(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 44
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
