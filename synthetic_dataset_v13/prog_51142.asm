; DESCRIPTION: Places a green 41x88 rectangle at position (359, 97).
; PLAN: r0=359(x), r1=97(y), r2=41(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 97
LDI r2, 41
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
