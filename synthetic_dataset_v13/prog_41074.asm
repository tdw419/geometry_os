; DESCRIPTION: Creates a purple circular shape at (446, 199) with radius 51.
; PLAN: r0=446(x), r1=199(y), r2=51(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 199
LDI r2, 51
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
