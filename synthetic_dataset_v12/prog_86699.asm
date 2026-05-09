; DESCRIPTION: Renders a red disk with center (98, 189) and radius 60.
; PLAN: r0=98(x), r1=189(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 189
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
