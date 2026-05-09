; DESCRIPTION: Renders a yellow disk with center (295, 105) and radius 68.
; PLAN: r0=295(x), r1=105(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 105
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
