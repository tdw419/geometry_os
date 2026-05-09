; DESCRIPTION: Renders a red disk with center (244, 86) and radius 66.
; PLAN: r0=244(x), r1=86(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 244
LDI r1, 86
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
