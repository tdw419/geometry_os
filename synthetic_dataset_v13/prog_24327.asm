; DESCRIPTION: Places a cyan circle of radius 42 at center (461, 49).
; PLAN: r0=461(x), r1=49(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 461
LDI r1, 49
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
