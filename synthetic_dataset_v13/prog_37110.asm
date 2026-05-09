; DESCRIPTION: Renders a red disk with center (276, 151) and radius 30.
; PLAN: r0=276(x), r1=151(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 151
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
