; DESCRIPTION: Places a magenta 26x112 rectangle at position (424, 118).
; PLAN: r0=424(x), r1=118(y), r2=26(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 118
LDI r2, 26
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
