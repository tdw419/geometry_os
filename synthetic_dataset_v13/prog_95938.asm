; DESCRIPTION: Renders a yellow disk with center (365, 198) and radius 22.
; PLAN: r0=365(x), r1=198(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 198
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
