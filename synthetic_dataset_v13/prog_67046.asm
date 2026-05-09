; DESCRIPTION: Renders a red disk with center (188, 216) and radius 14.
; PLAN: r0=188(x), r1=216(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 216
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
