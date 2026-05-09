; DESCRIPTION: Renders a yellow disk with center (167, 93) and radius 10.
; PLAN: r0=167(x), r1=93(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 93
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
