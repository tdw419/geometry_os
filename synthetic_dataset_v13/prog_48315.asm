; DESCRIPTION: Renders a red disk with center (455, 123) and radius 56.
; PLAN: r0=455(x), r1=123(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 123
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
