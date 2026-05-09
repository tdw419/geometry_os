; DESCRIPTION: Places a yellow circle of radius 24 at center (443, 141).
; PLAN: r0=443(x), r1=141(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 141
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
