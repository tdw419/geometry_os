; DESCRIPTION: Places a cyan circle of radius 33 at center (449, 58).
; PLAN: r0=449(x), r1=58(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 58
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
