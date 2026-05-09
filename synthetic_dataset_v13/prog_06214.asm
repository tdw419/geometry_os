; DESCRIPTION: Places a orange 81x74 rectangle at position (359, 115).
; PLAN: r0=359(x), r1=115(y), r2=81(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 115
LDI r2, 81
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
