; DESCRIPTION: Renders a green disk with center (21, 242) and radius 12.
; PLAN: r0=21(x), r1=242(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 242
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
