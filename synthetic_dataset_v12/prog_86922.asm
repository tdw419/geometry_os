; DESCRIPTION: Creates a blue circular shape at (446, 147) with radius 43.
; PLAN: r0=446(x), r1=147(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 147
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
