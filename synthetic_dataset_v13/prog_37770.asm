; DESCRIPTION: Renders a green disk with center (45, 57) and radius 28.
; PLAN: r0=45(x), r1=57(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 45
LDI r1, 57
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
