; DESCRIPTION: Places a cyan circle of radius 13 at center (439, 76).
; PLAN: r0=439(x), r1=76(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 76
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
