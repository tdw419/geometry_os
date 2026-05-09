; DESCRIPTION: Places a green 97x14 rectangle at position (65, 176).
; PLAN: r0=65(x), r1=176(y), r2=97(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 176
LDI r2, 97
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
