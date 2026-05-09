; DESCRIPTION: Renders a red disk with center (212, 139) and radius 38.
; PLAN: r0=212(x), r1=139(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 139
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
