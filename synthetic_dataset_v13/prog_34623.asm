; DESCRIPTION: Renders a black box of size 81x113 starting at (341, 124).
; PLAN: r0=341(x), r1=124(y), r2=81(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 124
LDI r2, 81
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
