; DESCRIPTION: Renders a red disk with center (376, 192) and radius 27.
; PLAN: r0=376(x), r1=192(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 192
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
