; DESCRIPTION: Renders a blue disk with center (187, 108) and radius 15.
; PLAN: r0=187(x), r1=108(y), r2=15(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 108
LDI r2, 15
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
