; DESCRIPTION: Places a cyan circle of radius 56 at center (216, 69).
; PLAN: r0=216(x), r1=69(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 69
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
