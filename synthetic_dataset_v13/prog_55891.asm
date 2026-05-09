; DESCRIPTION: Renders a red disk with center (95, 81) and radius 57.
; PLAN: r0=95(x), r1=81(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 81
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
