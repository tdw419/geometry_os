; DESCRIPTION: Places a green 49x23 rectangle at position (258, 206).
; PLAN: r0=258(x), r1=206(y), r2=49(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 206
LDI r2, 49
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
