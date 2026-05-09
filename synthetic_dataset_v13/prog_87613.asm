; DESCRIPTION: Places a black circle of radius 14 at center (18, 231).
; PLAN: r0=18(x), r1=231(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 231
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
