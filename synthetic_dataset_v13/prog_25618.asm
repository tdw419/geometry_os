; DESCRIPTION: Places a blue 49x66 rectangle at position (455, 164).
; PLAN: r0=455(x), r1=164(y), r2=49(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 164
LDI r2, 49
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
