; DESCRIPTION: Places a magenta 21x13 rectangle at position (382, 88).
; PLAN: r0=382(x), r1=88(y), r2=21(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 88
LDI r2, 21
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
