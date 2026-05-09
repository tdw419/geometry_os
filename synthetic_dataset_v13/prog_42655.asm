; DESCRIPTION: Renders a yellow disk with center (66, 50) and radius 36.
; PLAN: r0=66(x), r1=50(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 50
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
