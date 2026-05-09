; DESCRIPTION: Places a blue 13x34 rectangle at position (76, 6).
; PLAN: r0=76(x), r1=6(y), r2=13(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 6
LDI r2, 13
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
