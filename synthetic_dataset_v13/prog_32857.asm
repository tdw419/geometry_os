; DESCRIPTION: Renders a magenta box of size 25x118 starting at (476, 59).
; PLAN: r0=476(x), r1=59(y), r2=25(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 59
LDI r2, 25
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
