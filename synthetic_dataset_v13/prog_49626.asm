; DESCRIPTION: Places a magenta 88x61 rectangle at position (209, 52).
; PLAN: r0=209(x), r1=52(y), r2=88(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 52
LDI r2, 88
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
