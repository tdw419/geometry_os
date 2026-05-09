; DESCRIPTION: Places a magenta 30x50 rectangle at position (227, 157).
; PLAN: r0=227(x), r1=157(y), r2=30(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 157
LDI r2, 30
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
