; DESCRIPTION: Draws a magenta rectangle at (414, 221) with width 67 and height 24.
; PLAN: r0=414(x), r1=221(y), r2=67(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 221
LDI r2, 67
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
