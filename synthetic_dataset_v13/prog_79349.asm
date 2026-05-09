; DESCRIPTION: Places a black circle of radius 22 at center (471, 215).
; PLAN: r0=471(x), r1=215(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 215
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
