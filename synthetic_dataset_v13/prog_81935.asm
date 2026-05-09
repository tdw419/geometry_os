; DESCRIPTION: Renders a yellow disk with center (452, 168) and radius 24.
; PLAN: r0=452(x), r1=168(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 168
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
