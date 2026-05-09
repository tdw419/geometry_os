; DESCRIPTION: Renders a magenta box of size 49x112 starting at (156, 113).
; PLAN: r0=156(x), r1=113(y), r2=49(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 113
LDI r2, 49
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
