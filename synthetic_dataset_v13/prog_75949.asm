; DESCRIPTION: Renders a green disk with center (272, 205) and radius 33.
; PLAN: r0=272(x), r1=205(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 205
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
