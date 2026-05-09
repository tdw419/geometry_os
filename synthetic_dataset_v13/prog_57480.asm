; DESCRIPTION: Renders a red disk with center (30, 240) and radius 10.
; PLAN: r0=30(x), r1=240(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 240
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
