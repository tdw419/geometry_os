; DESCRIPTION: Renders a red disk with center (367, 75) and radius 55.
; PLAN: r0=367(x), r1=75(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 75
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
