; DESCRIPTION: Renders a magenta box of size 67x28 starting at (113, 85).
; PLAN: r0=113(x), r1=85(y), r2=67(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 85
LDI r2, 67
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
