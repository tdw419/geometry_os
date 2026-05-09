; DESCRIPTION: Creates a purple circular shape at (386, 60) with radius 36.
; PLAN: r0=386(x), r1=60(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 60
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
