; DESCRIPTION: Places a blue 101x88 rectangle at position (310, 38).
; PLAN: r0=310(x), r1=38(y), r2=101(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 38
LDI r2, 101
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
