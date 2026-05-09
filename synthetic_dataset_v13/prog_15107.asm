; DESCRIPTION: Places a orange 67x81 rectangle at position (76, 14).
; PLAN: r0=76(x), r1=14(y), r2=67(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 14
LDI r2, 67
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
