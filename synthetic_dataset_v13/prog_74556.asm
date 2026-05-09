; DESCRIPTION: Places a orange 117x16 rectangle at position (59, 74).
; PLAN: r0=59(x), r1=74(y), r2=117(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 74
LDI r2, 117
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
