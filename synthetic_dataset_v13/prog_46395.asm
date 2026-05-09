; DESCRIPTION: Renders a green disk with center (268, 93) and radius 21.
; PLAN: r0=268(x), r1=93(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 93
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
