; DESCRIPTION: Places a magenta 43x34 rectangle at position (6, 211).
; PLAN: r0=6(x), r1=211(y), r2=43(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 211
LDI r2, 43
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
