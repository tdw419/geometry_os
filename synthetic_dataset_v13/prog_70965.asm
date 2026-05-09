; DESCRIPTION: Renders a green disk with center (74, 161) and radius 46.
; PLAN: r0=74(x), r1=161(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 161
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
