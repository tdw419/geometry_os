; DESCRIPTION: Renders a yellow disk with center (217, 82) and radius 72.
; PLAN: r0=217(x), r1=82(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 82
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
