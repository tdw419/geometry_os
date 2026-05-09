; DESCRIPTION: Creates a blue circular shape at (446, 176) with radius 10.
; PLAN: r0=446(x), r1=176(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 176
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
