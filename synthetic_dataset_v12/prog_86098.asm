; DESCRIPTION: Places a cyan circle of radius 42 at center (459, 130).
; PLAN: r0=459(x), r1=130(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 459
LDI r1, 130
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
