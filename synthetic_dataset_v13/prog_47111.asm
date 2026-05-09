; DESCRIPTION: Renders a red disk with center (464, 139) and radius 26.
; PLAN: r0=464(x), r1=139(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 464
LDI r1, 139
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
