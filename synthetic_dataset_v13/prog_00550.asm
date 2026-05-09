; DESCRIPTION: Renders a green disk with center (327, 26) and radius 18.
; PLAN: r0=327(x), r1=26(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 26
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
