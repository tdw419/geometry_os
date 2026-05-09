; DESCRIPTION: Places a orange 74x115 rectangle at position (99, 37).
; PLAN: r0=99(x), r1=37(y), r2=74(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 37
LDI r2, 74
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
