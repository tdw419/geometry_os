; DESCRIPTION: Places a blue 67x64 rectangle at position (148, 105).
; PLAN: r0=148(x), r1=105(y), r2=67(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 105
LDI r2, 67
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
