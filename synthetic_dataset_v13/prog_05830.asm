; DESCRIPTION: Renders a yellow disk with center (380, 103) and radius 47.
; PLAN: r0=380(x), r1=103(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 103
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
