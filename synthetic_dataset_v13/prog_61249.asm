; DESCRIPTION: Renders a magenta box of size 114x116 starting at (21, 74).
; PLAN: r0=21(x), r1=74(y), r2=114(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 74
LDI r2, 114
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
