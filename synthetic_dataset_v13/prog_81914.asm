; DESCRIPTION: Places a cyan circle of radius 45 at center (75, 76).
; PLAN: r0=75(x), r1=76(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 76
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
