; DESCRIPTION: Renders a yellow disk with center (304, 50) and radius 40.
; PLAN: r0=304(x), r1=50(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 50
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
