; DESCRIPTION: Places a blue 100x30 rectangle at position (268, 22).
; PLAN: r0=268(x), r1=22(y), r2=100(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 22
LDI r2, 100
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
