; DESCRIPTION: Places a red 58x13 rectangle at position (432, 157).
; PLAN: r0=432(x), r1=157(y), r2=58(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 157
LDI r2, 58
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
