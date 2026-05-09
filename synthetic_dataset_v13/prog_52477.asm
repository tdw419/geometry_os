; DESCRIPTION: Renders a red disk with center (181, 92) and radius 21.
; PLAN: r0=181(x), r1=92(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 92
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
