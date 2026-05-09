; DESCRIPTION: Renders a red disk with center (130, 135) and radius 78.
; PLAN: r0=130(x), r1=135(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 135
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
