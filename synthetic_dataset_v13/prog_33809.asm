; DESCRIPTION: Renders a black box of size 59x92 starting at (274, 106).
; PLAN: r0=274(x), r1=106(y), r2=59(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 106
LDI r2, 59
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
