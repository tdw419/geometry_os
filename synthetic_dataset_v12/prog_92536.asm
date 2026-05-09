; DESCRIPTION: Renders a red disk with center (290, 176) and radius 32.
; PLAN: r0=290(x), r1=176(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 176
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
