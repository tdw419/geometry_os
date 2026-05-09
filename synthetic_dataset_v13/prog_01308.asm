; DESCRIPTION: Renders a red disk with center (91, 148) and radius 43.
; PLAN: r0=91(x), r1=148(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 148
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
