; DESCRIPTION: Places a blue 76x16 rectangle at position (98, 97).
; PLAN: r0=98(x), r1=97(y), r2=76(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 97
LDI r2, 76
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
