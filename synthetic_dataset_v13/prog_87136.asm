; DESCRIPTION: Places a cyan circle of radius 10 at center (334, 208).
; PLAN: r0=334(x), r1=208(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 208
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
