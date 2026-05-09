; DESCRIPTION: Renders a green disk with center (283, 111) and radius 49.
; PLAN: r0=283(x), r1=111(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 111
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
