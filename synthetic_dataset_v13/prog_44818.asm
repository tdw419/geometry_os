; DESCRIPTION: Renders a red disk with center (50, 179) and radius 14.
; PLAN: r0=50(x), r1=179(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 179
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
