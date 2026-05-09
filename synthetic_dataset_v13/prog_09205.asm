; DESCRIPTION: Places a purple circle of radius 75 at center (291, 174).
; PLAN: r0=291(x), r1=174(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 174
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
