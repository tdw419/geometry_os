; DESCRIPTION: Places a magenta 49x112 rectangle at position (424, 108).
; PLAN: r0=424(x), r1=108(y), r2=49(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 108
LDI r2, 49
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
