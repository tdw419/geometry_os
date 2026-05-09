; DESCRIPTION: Renders a red disk with center (362, 83) and radius 37.
; PLAN: r0=362(x), r1=83(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 83
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
