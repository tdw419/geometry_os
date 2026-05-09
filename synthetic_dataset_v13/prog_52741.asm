; DESCRIPTION: Creates a blue circular shape at (443, 134) with radius 46.
; PLAN: r0=443(x), r1=134(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 134
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
