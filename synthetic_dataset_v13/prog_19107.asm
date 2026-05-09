; DESCRIPTION: Renders a red disk with center (88, 121) and radius 28.
; PLAN: r0=88(x), r1=121(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 121
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
