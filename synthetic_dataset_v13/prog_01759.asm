; DESCRIPTION: Places a green 118x49 rectangle at position (24, 13).
; PLAN: r0=24(x), r1=13(y), r2=118(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 13
LDI r2, 118
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
