; DESCRIPTION: Renders a green disk with center (213, 92) and radius 45.
; PLAN: r0=213(x), r1=92(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 92
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
