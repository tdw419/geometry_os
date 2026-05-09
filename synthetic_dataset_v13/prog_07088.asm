; DESCRIPTION: Draws a purple circle centered at (443, 184) with radius 28.
; PLAN: r0=443(x), r1=184(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 184
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
