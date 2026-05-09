; DESCRIPTION: Renders a magenta box of size 88x111 starting at (228, 58).
; PLAN: r0=228(x), r1=58(y), r2=88(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 58
LDI r2, 88
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
