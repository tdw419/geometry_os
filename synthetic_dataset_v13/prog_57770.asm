; DESCRIPTION: Places a orange 82x72 rectangle at position (367, 67).
; PLAN: r0=367(x), r1=67(y), r2=82(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 67
LDI r2, 82
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
