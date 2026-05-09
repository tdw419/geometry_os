; DESCRIPTION: Renders a green disk with center (320, 177) and radius 40.
; PLAN: r0=320(x), r1=177(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 320
LDI r1, 177
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
