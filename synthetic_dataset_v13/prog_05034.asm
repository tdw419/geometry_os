; DESCRIPTION: Places a white 23x78 rectangle at position (258, 126).
; PLAN: r0=258(x), r1=126(y), r2=23(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 126
LDI r2, 23
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
