; DESCRIPTION: Places a magenta 43x94 rectangle at position (126, 81).
; PLAN: r0=126(x), r1=81(y), r2=43(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 81
LDI r2, 43
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
