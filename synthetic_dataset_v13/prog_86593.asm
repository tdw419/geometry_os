; DESCRIPTION: Renders a green disk with center (455, 191) and radius 29.
; PLAN: r0=455(x), r1=191(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 191
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
