; DESCRIPTION: Renders a yellow disk with center (108, 154) and radius 58.
; PLAN: r0=108(x), r1=154(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 154
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
