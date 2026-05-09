; DESCRIPTION: Renders a green disk with center (194, 146) and radius 36.
; PLAN: r0=194(x), r1=146(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 146
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
