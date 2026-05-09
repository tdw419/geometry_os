; DESCRIPTION: Renders a red disk with center (481, 34) and radius 25.
; PLAN: r0=481(x), r1=34(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 481
LDI r1, 34
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
