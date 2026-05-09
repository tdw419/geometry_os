; DESCRIPTION: Places a blue 49x12 rectangle at position (431, 69).
; PLAN: r0=431(x), r1=69(y), r2=49(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 69
LDI r2, 49
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
