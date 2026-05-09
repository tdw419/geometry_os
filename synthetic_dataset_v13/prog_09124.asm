; DESCRIPTION: Places a magenta 58x32 rectangle at position (339, 188).
; PLAN: r0=339(x), r1=188(y), r2=58(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 188
LDI r2, 58
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
