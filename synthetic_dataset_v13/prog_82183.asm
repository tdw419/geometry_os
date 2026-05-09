; DESCRIPTION: Places a blue 30x114 rectangle at position (414, 50).
; PLAN: r0=414(x), r1=50(y), r2=30(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 50
LDI r2, 30
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
