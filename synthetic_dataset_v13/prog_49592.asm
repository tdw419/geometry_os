; DESCRIPTION: Renders a yellow disk with center (443, 144) and radius 64.
; PLAN: r0=443(x), r1=144(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 144
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
