; DESCRIPTION: Renders a red disk with center (323, 111) and radius 34.
; PLAN: r0=323(x), r1=111(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 111
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
