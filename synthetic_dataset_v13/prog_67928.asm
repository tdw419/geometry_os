; DESCRIPTION: Places a orange 70x54 rectangle at position (229, 67).
; PLAN: r0=229(x), r1=67(y), r2=70(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 67
LDI r2, 70
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
