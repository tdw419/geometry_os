; DESCRIPTION: Places a orange 103x97 rectangle at position (344, 57).
; PLAN: r0=344(x), r1=57(y), r2=103(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 57
LDI r2, 103
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
