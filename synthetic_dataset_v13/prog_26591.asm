; DESCRIPTION: Renders a green disk with center (450, 81) and radius 27.
; PLAN: r0=450(x), r1=81(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 81
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
