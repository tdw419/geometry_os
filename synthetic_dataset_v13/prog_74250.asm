; DESCRIPTION: Places a green 105x28 rectangle at position (252, 176).
; PLAN: r0=252(x), r1=176(y), r2=105(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 176
LDI r2, 105
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
