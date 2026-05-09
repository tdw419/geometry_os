; DESCRIPTION: Renders a green disk with center (117, 120) and radius 27.
; PLAN: r0=117(x), r1=120(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 120
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
