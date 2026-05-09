; DESCRIPTION: Renders a magenta box of size 63x61 starting at (306, 101).
; PLAN: r0=306(x), r1=101(y), r2=63(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 101
LDI r2, 63
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
