; DESCRIPTION: Places a magenta 26x61 rectangle at position (195, 26).
; PLAN: r0=195(x), r1=26(y), r2=26(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 26
LDI r2, 26
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
