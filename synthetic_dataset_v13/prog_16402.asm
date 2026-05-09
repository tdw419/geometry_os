; DESCRIPTION: Renders a magenta box of size 67x25 starting at (145, 101).
; PLAN: r0=145(x), r1=101(y), r2=67(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 101
LDI r2, 67
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
