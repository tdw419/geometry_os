; DESCRIPTION: Places a blue circle of radius 71 at center (376, 154).
; PLAN: r0=376(x), r1=154(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 154
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
