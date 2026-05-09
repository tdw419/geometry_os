; DESCRIPTION: Renders a blue disk with center (294, 149) and radius 44.
; PLAN: r0=294(x), r1=149(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 149
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
