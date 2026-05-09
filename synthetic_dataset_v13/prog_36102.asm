; DESCRIPTION: Places a blue 53x84 rectangle at position (384, 6).
; PLAN: r0=384(x), r1=6(y), r2=53(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 6
LDI r2, 53
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
