; DESCRIPTION: Renders a red disk with center (417, 166) and radius 57.
; PLAN: r0=417(x), r1=166(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 166
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
