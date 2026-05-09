; DESCRIPTION: Renders a green disk with center (209, 194) and radius 34.
; PLAN: r0=209(x), r1=194(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 194
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
