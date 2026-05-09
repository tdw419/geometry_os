; DESCRIPTION: Renders a red disk with center (134, 93) and radius 47.
; PLAN: r0=134(x), r1=93(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 93
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
