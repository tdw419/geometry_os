; DESCRIPTION: Renders a red disk with center (169, 164) and radius 47.
; PLAN: r0=169(x), r1=164(y), r2=47(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 164
LDI r2, 47
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
