; DESCRIPTION: Places a green 97x88 rectangle at position (52, 16).
; PLAN: r0=52(x), r1=16(y), r2=97(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 16
LDI r2, 97
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
