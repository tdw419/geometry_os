; DESCRIPTION: Places a blue 76x49 rectangle at position (249, 34).
; PLAN: r0=249(x), r1=34(y), r2=76(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 34
LDI r2, 76
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
