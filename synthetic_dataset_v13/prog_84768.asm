; DESCRIPTION: Renders a red disk with center (45, 19) and radius 13.
; PLAN: r0=45(x), r1=19(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 19
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
