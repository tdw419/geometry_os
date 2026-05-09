; DESCRIPTION: Places a black circle of radius 70 at center (126, 85).
; PLAN: r0=126(x), r1=85(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 85
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
