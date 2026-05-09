; DESCRIPTION: Places a orange 29x60 rectangle at position (120, 67).
; PLAN: r0=120(x), r1=67(y), r2=29(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 67
LDI r2, 29
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
