; DESCRIPTION: Places a orange 117x58 rectangle at position (335, 67).
; PLAN: r0=335(x), r1=67(y), r2=117(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 67
LDI r2, 117
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
