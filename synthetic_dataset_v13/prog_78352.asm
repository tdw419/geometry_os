; DESCRIPTION: Renders a red disk with center (332, 93) and radius 40.
; PLAN: r0=332(x), r1=93(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 93
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
