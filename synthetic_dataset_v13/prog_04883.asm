; DESCRIPTION: Places a blue 53x96 rectangle at position (117, 19).
; PLAN: r0=117(x), r1=19(y), r2=53(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 19
LDI r2, 53
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
