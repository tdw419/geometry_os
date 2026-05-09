; DESCRIPTION: Renders a red disk with center (259, 154) and radius 71.
; PLAN: r0=259(x), r1=154(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 154
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
