; DESCRIPTION: Renders a red disk with center (179, 165) and radius 25.
; PLAN: r0=179(x), r1=165(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 165
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
