; DESCRIPTION: Places a green 49x68 rectangle at position (134, 149).
; PLAN: r0=134(x), r1=149(y), r2=49(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 149
LDI r2, 49
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
