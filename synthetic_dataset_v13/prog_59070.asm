; DESCRIPTION: Places a orange 101x115 rectangle at position (370, 62).
; PLAN: r0=370(x), r1=62(y), r2=101(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 62
LDI r2, 101
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
