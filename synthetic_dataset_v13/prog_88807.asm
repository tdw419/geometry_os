; DESCRIPTION: Places a magenta 74x108 rectangle at position (249, 2).
; PLAN: r0=249(x), r1=2(y), r2=74(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 2
LDI r2, 74
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
