; DESCRIPTION: Renders a red disk with center (408, 189) and radius 35.
; PLAN: r0=408(x), r1=189(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 189
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
