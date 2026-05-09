; DESCRIPTION: Renders a red disk with center (307, 170) and radius 47.
; PLAN: r0=307(x), r1=170(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 170
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
