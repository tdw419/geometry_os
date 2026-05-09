; DESCRIPTION: Renders a orange disk with center (242, 176) and radius 66.
; PLAN: r0=242(x), r1=176(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 176
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
