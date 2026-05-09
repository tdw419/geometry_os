; DESCRIPTION: Draws a purple rectangle at (304, 154) with width 67 and height 49.
; PLAN: r0=304(x), r1=154(y), r2=67(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 154
LDI r2, 67
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
