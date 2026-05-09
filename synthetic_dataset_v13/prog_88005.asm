; DESCRIPTION: Renders a magenta box of size 113x88 starting at (252, 58).
; PLAN: r0=252(x), r1=58(y), r2=113(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 58
LDI r2, 113
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
