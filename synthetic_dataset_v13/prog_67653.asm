; DESCRIPTION: Renders a green disk with center (118, 121) and radius 27.
; PLAN: r0=118(x), r1=121(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 121
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
