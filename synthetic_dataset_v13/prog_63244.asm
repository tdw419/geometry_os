; DESCRIPTION: Renders a black box of size 20x71 starting at (274, 0).
; PLAN: r0=274(x), r1=0(y), r2=20(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 0
LDI r2, 20
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
