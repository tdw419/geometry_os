; DESCRIPTION: Renders a green disk with center (284, 114) and radius 43.
; PLAN: r0=284(x), r1=114(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 114
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
