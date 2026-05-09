; DESCRIPTION: Renders a red disk with center (247, 131) and radius 71.
; PLAN: r0=247(x), r1=131(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 131
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
