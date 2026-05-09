; DESCRIPTION: Renders a magenta box of size 75x49 starting at (246, 101).
; PLAN: r0=246(x), r1=101(y), r2=75(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 101
LDI r2, 75
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
