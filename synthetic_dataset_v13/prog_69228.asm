; DESCRIPTION: Renders a yellow disk with center (146, 158) and radius 66.
; PLAN: r0=146(x), r1=158(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 158
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
