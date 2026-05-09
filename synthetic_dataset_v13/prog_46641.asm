; DESCRIPTION: Renders a red disk with center (149, 111) and radius 45.
; PLAN: r0=149(x), r1=111(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 111
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
