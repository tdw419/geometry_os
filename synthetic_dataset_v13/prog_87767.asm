; DESCRIPTION: Renders a red disk with center (123, 146) and radius 62.
; PLAN: r0=123(x), r1=146(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 146
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
