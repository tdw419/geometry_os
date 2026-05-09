; DESCRIPTION: Places a red 101x83 rectangle at position (49, 68).
; PLAN: r0=49(x), r1=68(y), r2=101(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 68
LDI r2, 101
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
