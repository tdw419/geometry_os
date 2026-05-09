; DESCRIPTION: Renders a red disk with center (169, 93) and radius 58.
; PLAN: r0=169(x), r1=93(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 93
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
