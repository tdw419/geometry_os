; DESCRIPTION: Renders a green disk with center (242, 163) and radius 60.
; PLAN: r0=242(x), r1=163(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 163
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
