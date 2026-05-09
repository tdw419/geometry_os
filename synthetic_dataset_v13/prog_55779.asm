; DESCRIPTION: Creates a purple circular shape at (366, 173) with radius 51.
; PLAN: r0=366(x), r1=173(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 173
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
