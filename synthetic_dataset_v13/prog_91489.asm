; DESCRIPTION: Places a cyan circle of radius 78 at center (82, 93).
; PLAN: r0=82(x), r1=93(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 93
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
