; DESCRIPTION: Renders a magenta box of size 29x88 starting at (376, 62).
; PLAN: r0=376(x), r1=62(y), r2=29(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 62
LDI r2, 29
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
