; DESCRIPTION: Places a orange 74x15 rectangle at position (359, 186).
; PLAN: r0=359(x), r1=186(y), r2=74(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 186
LDI r2, 74
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
