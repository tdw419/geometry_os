; DESCRIPTION: Places a cyan circle of radius 20 at center (421, 54).
; PLAN: r0=421(x), r1=54(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 54
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
