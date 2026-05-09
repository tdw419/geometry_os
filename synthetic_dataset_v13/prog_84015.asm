; DESCRIPTION: Places a magenta 49x12 rectangle at position (70, 13).
; PLAN: r0=70(x), r1=13(y), r2=49(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 13
LDI r2, 49
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
