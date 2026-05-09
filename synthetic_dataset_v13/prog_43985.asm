; DESCRIPTION: Places a cyan circle of radius 60 at center (75, 176).
; PLAN: r0=75(x), r1=176(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 176
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
