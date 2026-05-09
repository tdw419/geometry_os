; DESCRIPTION: Renders a yellow disk with center (466, 186) and radius 28.
; PLAN: r0=466(x), r1=186(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 466
LDI r1, 186
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
