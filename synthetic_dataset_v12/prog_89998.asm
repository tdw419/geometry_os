; DESCRIPTION: Renders a yellow disk with center (386, 108) and radius 29.
; PLAN: r0=386(x), r1=108(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 386
LDI r1, 108
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
