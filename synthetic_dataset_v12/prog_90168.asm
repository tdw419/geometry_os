; DESCRIPTION: Renders a blue disk with center (443, 122) and radius 43.
; PLAN: r0=443(x), r1=122(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 122
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
