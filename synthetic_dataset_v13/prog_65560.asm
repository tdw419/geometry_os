; DESCRIPTION: Places a purple circle of radius 77 at center (291, 171).
; PLAN: r0=291(x), r1=171(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 171
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
