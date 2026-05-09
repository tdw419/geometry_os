; DESCRIPTION: Places a magenta 21x88 rectangle at position (265, 103).
; PLAN: r0=265(x), r1=103(y), r2=21(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 103
LDI r2, 21
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
