; DESCRIPTION: Renders a red disk with center (140, 60) and radius 39.
; PLAN: r0=140(x), r1=60(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 60
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
