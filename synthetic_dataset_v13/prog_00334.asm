; DESCRIPTION: Places a magenta 19x90 rectangle at position (227, 147).
; PLAN: r0=227(x), r1=147(y), r2=19(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 147
LDI r2, 19
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
