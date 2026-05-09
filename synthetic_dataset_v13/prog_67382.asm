; DESCRIPTION: Places a cyan circle of radius 56 at center (357, 123).
; PLAN: r0=357(x), r1=123(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 357
LDI r1, 123
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
