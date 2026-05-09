; DESCRIPTION: Draws a black rectangle at (414, 112) with width 32 and height 109.
; PLAN: r0=414(x), r1=112(y), r2=32(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 112
LDI r2, 32
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
