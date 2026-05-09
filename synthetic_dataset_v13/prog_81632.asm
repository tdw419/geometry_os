; DESCRIPTION: Renders a yellow disk with center (344, 161) and radius 71.
; PLAN: r0=344(x), r1=161(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 161
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
