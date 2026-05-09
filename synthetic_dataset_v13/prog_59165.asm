; DESCRIPTION: Renders a magenta box of size 25x114 starting at (408, 22).
; PLAN: r0=408(x), r1=22(y), r2=25(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 22
LDI r2, 25
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
