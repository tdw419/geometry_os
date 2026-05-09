; DESCRIPTION: Places a orange 93x107 rectangle at position (344, 32).
; PLAN: r0=344(x), r1=32(y), r2=93(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 32
LDI r2, 93
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
