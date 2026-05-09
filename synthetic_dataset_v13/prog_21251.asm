; DESCRIPTION: Renders a yellow disk with center (311, 152) and radius 70.
; PLAN: r0=311(x), r1=152(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 152
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
