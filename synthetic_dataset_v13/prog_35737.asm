; DESCRIPTION: Places a green 105x78 rectangle at position (76, 4).
; PLAN: r0=76(x), r1=4(y), r2=105(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 4
LDI r2, 105
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
