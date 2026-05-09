; DESCRIPTION: Places a green 95x49 rectangle at position (252, 183).
; PLAN: r0=252(x), r1=183(y), r2=95(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 183
LDI r2, 95
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
