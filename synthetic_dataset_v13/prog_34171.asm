; DESCRIPTION: Renders a green disk with center (126, 102) and radius 63.
; PLAN: r0=126(x), r1=102(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 102
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
