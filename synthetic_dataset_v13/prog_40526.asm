; DESCRIPTION: Renders a yellow disk with center (394, 58) and radius 38.
; PLAN: r0=394(x), r1=58(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 58
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
