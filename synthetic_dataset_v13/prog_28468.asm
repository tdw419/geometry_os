; DESCRIPTION: Renders a red disk with center (192, 93) and radius 52.
; PLAN: r0=192(x), r1=93(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 93
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
