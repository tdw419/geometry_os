; DESCRIPTION: Renders a yellow disk with center (183, 93) and radius 70.
; PLAN: r0=183(x), r1=93(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 93
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
