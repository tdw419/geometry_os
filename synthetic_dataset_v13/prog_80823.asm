; DESCRIPTION: Places a cyan circle of radius 54 at center (334, 120).
; PLAN: r0=334(x), r1=120(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 120
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
