; DESCRIPTION: Renders a green disk with center (120, 164) and radius 24.
; PLAN: r0=120(x), r1=164(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 164
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
