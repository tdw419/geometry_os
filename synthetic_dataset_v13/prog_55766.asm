; DESCRIPTION: Renders a red disk with center (311, 144) and radius 67.
; PLAN: r0=311(x), r1=144(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 144
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
