; DESCRIPTION: Places a magenta 64x34 rectangle at position (353, 4).
; PLAN: r0=353(x), r1=4(y), r2=64(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 4
LDI r2, 64
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
