; DESCRIPTION: Creates a purple circular shape at (197, 89) with radius 61.
; PLAN: r0=197(x), r1=89(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 89
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
