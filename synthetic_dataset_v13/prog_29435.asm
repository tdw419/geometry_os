; DESCRIPTION: Renders a red disk with center (286, 164) and radius 78.
; PLAN: r0=286(x), r1=164(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 164
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
