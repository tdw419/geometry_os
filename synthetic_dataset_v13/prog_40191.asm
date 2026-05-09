; DESCRIPTION: Renders a blue box of size 34x78 starting at (246, 67).
; PLAN: r0=246(x), r1=67(y), r2=34(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 67
LDI r2, 34
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
