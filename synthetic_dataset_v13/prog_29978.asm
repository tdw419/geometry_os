; DESCRIPTION: Renders a red disk with center (188, 126) and radius 49.
; PLAN: r0=188(x), r1=126(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 126
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
