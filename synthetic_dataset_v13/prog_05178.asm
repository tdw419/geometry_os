; DESCRIPTION: Places a orange 67x16 rectangle at position (335, 156).
; PLAN: r0=335(x), r1=156(y), r2=67(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 156
LDI r2, 67
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
