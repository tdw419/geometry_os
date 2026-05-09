; DESCRIPTION: Renders a white disk with center (301, 167) and radius 65.
; PLAN: r0=301(x), r1=167(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 167
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
