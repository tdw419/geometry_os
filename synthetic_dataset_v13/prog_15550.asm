; DESCRIPTION: Renders a orange disk with center (303, 208) and radius 32.
; PLAN: r0=303(x), r1=208(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 208
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
