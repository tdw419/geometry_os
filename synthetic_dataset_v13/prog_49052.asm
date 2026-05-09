; DESCRIPTION: Renders a blue box of size 88x107 starting at (246, 28).
; PLAN: r0=246(x), r1=28(y), r2=88(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 28
LDI r2, 88
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
