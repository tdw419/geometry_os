; DESCRIPTION: Renders a green disk with center (209, 132) and radius 58.
; PLAN: r0=209(x), r1=132(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 132
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
