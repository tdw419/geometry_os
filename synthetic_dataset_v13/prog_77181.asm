; DESCRIPTION: Places a black circle of radius 70 at center (108, 176).
; PLAN: r0=108(x), r1=176(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 176
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
