; DESCRIPTION: Places a blue 49x76 rectangle at position (326, 13).
; PLAN: r0=326(x), r1=13(y), r2=49(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 13
LDI r2, 49
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
