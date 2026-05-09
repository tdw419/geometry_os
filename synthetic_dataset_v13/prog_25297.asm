; DESCRIPTION: Renders a green disk with center (362, 45) and radius 14.
; PLAN: r0=362(x), r1=45(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 45
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
