; DESCRIPTION: Renders a yellow disk with center (413, 117) and radius 11.
; PLAN: r0=413(x), r1=117(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 117
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
