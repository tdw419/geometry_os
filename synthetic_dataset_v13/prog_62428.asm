; DESCRIPTION: Places a green 89x35 rectangle at position (207, 183).
; PLAN: r0=207(x), r1=183(y), r2=89(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 183
LDI r2, 89
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
