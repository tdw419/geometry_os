; DESCRIPTION: Places a cyan circle of radius 76 at center (126, 148).
; PLAN: r0=126(x), r1=148(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 148
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
