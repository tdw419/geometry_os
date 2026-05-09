; DESCRIPTION: Places a orange 58x21 rectangle at position (124, 67).
; PLAN: r0=124(x), r1=67(y), r2=58(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 67
LDI r2, 58
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
