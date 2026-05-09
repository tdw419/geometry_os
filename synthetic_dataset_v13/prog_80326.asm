; DESCRIPTION: Renders a magenta box of size 52x72 starting at (67, 2).
; PLAN: r0=67(x), r1=2(y), r2=52(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 2
LDI r2, 52
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
