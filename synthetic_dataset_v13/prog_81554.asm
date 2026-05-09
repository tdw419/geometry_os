; DESCRIPTION: Renders a yellow disk with center (216, 186) and radius 57.
; PLAN: r0=216(x), r1=186(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 186
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
