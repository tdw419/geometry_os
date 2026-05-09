; DESCRIPTION: Renders a black disk with center (216, 186) and radius 68.
; PLAN: r0=216(x), r1=186(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 186
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
