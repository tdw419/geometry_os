; DESCRIPTION: Renders a blue box of size 82x67 starting at (73, 101).
; PLAN: r0=73(x), r1=101(y), r2=82(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 101
LDI r2, 82
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
