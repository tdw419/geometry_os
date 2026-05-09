; DESCRIPTION: Renders a green disk with center (205, 73) and radius 50.
; PLAN: r0=205(x), r1=73(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 73
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
