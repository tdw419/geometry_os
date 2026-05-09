; DESCRIPTION: Creates a purple circular shape at (386, 164) with radius 44.
; PLAN: r0=386(x), r1=164(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 164
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
