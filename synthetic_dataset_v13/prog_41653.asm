; DESCRIPTION: Renders a green disk with center (205, 103) and radius 72.
; PLAN: r0=205(x), r1=103(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 103
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
