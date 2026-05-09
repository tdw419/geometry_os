; DESCRIPTION: Places a cyan circle of radius 56 at center (319, 84).
; PLAN: r0=319(x), r1=84(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 84
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
