; DESCRIPTION: Places a black circle of radius 77 at center (366, 173).
; PLAN: r0=366(x), r1=173(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 173
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
