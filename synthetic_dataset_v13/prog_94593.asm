; DESCRIPTION: Renders a magenta box of size 92x56 starting at (114, 151).
; PLAN: r0=114(x), r1=151(y), r2=92(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 151
LDI r2, 92
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
