; DESCRIPTION: Places a cyan circle of radius 22 at center (22, 56).
; PLAN: r0=22(x), r1=56(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 22
LDI r1, 56
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
