; DESCRIPTION: Renders a red disk with center (302, 116) and radius 53.
; PLAN: r0=302(x), r1=116(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 116
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
