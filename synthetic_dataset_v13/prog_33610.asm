; DESCRIPTION: Renders a yellow disk with center (91, 109) and radius 21.
; PLAN: r0=91(x), r1=109(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 109
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
