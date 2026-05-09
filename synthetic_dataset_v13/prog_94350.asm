; DESCRIPTION: Renders a green disk with center (241, 74) and radius 63.
; PLAN: r0=241(x), r1=74(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 74
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
