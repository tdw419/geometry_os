; DESCRIPTION: Places a blue 49x34 rectangle at position (29, 12).
; PLAN: r0=29(x), r1=12(y), r2=49(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 12
LDI r2, 49
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
