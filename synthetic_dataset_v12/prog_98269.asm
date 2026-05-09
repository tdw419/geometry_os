; DESCRIPTION: Renders a yellow disk with center (154, 48) and radius 12.
; PLAN: r0=154(x), r1=48(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 48
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
