; DESCRIPTION: Renders a red disk with center (36, 151) and radius 36.
; PLAN: r0=36(x), r1=151(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 36
LDI r1, 151
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
