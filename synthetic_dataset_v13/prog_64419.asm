; DESCRIPTION: Renders a green disk with center (214, 122) and radius 24.
; PLAN: r0=214(x), r1=122(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 122
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
