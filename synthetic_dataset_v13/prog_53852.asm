; DESCRIPTION: Renders a red disk with center (378, 55) and radius 48.
; PLAN: r0=378(x), r1=55(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 55
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
