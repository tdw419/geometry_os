; DESCRIPTION: Creates a black circular shape at (449, 133) with radius 46.
; PLAN: r0=449(x), r1=133(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 133
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
