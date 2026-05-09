; DESCRIPTION: Places a green 43x88 rectangle at position (119, 62).
; PLAN: r0=119(x), r1=62(y), r2=43(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 62
LDI r2, 43
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
