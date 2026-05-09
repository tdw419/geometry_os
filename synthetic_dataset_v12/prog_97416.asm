; DESCRIPTION: Renders a green disk with center (455, 141) and radius 56.
; PLAN: r0=455(x), r1=141(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 141
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
