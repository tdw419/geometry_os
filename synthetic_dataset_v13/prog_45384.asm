; DESCRIPTION: Places a red 117x58 rectangle at position (30, 188).
; PLAN: r0=30(x), r1=188(y), r2=117(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 188
LDI r2, 117
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
