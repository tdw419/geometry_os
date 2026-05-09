; DESCRIPTION: Creates a purple circular shape at (307, 168) with radius 55.
; PLAN: r0=307(x), r1=168(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 168
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
