; DESCRIPTION: Places a cyan circle of radius 43 at center (80, 77).
; PLAN: r0=80(x), r1=77(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 77
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
