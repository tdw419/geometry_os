; DESCRIPTION: Places a cyan circle of radius 46 at center (449, 115).
; PLAN: r0=449(x), r1=115(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 115
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
