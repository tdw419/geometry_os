; DESCRIPTION: Renders a green disk with center (225, 92) and radius 39.
; PLAN: r0=225(x), r1=92(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 92
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
