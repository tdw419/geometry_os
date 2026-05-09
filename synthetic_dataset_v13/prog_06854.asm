; DESCRIPTION: Renders a red disk with center (370, 139) and radius 50.
; PLAN: r0=370(x), r1=139(y), r2=50(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 139
LDI r2, 50
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
