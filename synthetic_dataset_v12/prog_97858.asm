; DESCRIPTION: Renders a yellow disk with center (239, 210) and radius 29.
; PLAN: r0=239(x), r1=210(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 210
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
