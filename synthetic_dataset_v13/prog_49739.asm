; DESCRIPTION: Renders a red disk with center (156, 115) and radius 61.
; PLAN: r0=156(x), r1=115(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 115
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
