; DESCRIPTION: Places a orange 118x81 rectangle at position (108, 117).
; PLAN: r0=108(x), r1=117(y), r2=118(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 117
LDI r2, 118
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
