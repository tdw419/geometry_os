; DESCRIPTION: Creates a purple circular shape at (392, 132) with radius 53.
; PLAN: r0=392(x), r1=132(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 132
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
