; DESCRIPTION: Renders a magenta box of size 61x58 starting at (183, 138).
; PLAN: r0=183(x), r1=138(y), r2=61(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 138
LDI r2, 61
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
