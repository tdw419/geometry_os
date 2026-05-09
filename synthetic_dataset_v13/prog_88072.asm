; DESCRIPTION: Places a yellow circle of radius 31 at center (126, 219).
; PLAN: r0=126(x), r1=219(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 219
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
