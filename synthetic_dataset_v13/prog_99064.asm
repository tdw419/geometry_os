; DESCRIPTION: Renders a green disk with center (469, 206) and radius 10.
; PLAN: r0=469(x), r1=206(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 206
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
