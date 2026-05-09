; DESCRIPTION: Places a cyan circle of radius 38 at center (40, 99).
; PLAN: r0=40(x), r1=99(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 99
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
