; DESCRIPTION: Renders a black disk with center (279, 68) and radius 21.
; PLAN: r0=279(x), r1=68(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 68
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
