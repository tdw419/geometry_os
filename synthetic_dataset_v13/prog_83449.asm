; DESCRIPTION: Renders a black box of size 15x83 starting at (341, 113).
; PLAN: r0=341(x), r1=113(y), r2=15(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 113
LDI r2, 15
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
