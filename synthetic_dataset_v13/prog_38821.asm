; DESCRIPTION: Renders a red disk with center (306, 167) and radius 63.
; PLAN: r0=306(x), r1=167(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 306
LDI r1, 167
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
