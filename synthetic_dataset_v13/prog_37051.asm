; DESCRIPTION: Places a cyan circle of radius 28 at center (151, 126).
; PLAN: r0=151(x), r1=126(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 126
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
