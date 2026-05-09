; DESCRIPTION: Renders a green disk with center (150, 87) and radius 72.
; PLAN: r0=150(x), r1=87(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 87
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
