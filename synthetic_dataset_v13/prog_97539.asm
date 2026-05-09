; DESCRIPTION: Places a cyan circle of radius 75 at center (334, 75).
; PLAN: r0=334(x), r1=75(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 75
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
