; DESCRIPTION: Places a orange 81x75 rectangle at position (14, 180).
; PLAN: r0=14(x), r1=180(y), r2=81(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 180
LDI r2, 81
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
