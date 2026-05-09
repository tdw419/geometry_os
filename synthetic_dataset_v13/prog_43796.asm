; DESCRIPTION: Renders a magenta box of size 116x114 starting at (138, 44).
; PLAN: r0=138(x), r1=44(y), r2=116(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 44
LDI r2, 116
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
