; DESCRIPTION: Renders a yellow disk with center (446, 122) and radius 33.
; PLAN: r0=446(x), r1=122(y), r2=33(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 122
LDI r2, 33
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
