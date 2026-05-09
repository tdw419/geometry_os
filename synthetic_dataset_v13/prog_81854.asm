; DESCRIPTION: Renders a yellow disk with center (368, 135) and radius 58.
; PLAN: r0=368(x), r1=135(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 135
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
