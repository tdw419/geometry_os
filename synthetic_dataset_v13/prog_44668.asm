; DESCRIPTION: Renders a red disk with center (131, 152) and radius 74.
; PLAN: r0=131(x), r1=152(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 152
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
