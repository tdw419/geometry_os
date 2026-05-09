; DESCRIPTION: Creates a blue circular shape at (458, 127) with radius 36.
; PLAN: r0=458(x), r1=127(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 127
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
