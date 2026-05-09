; DESCRIPTION: Places a cyan circle of radius 77 at center (283, 77).
; PLAN: r0=283(x), r1=77(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 77
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
