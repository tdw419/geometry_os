; DESCRIPTION: Places a orange 76x23 rectangle at position (67, 18).
; PLAN: r0=67(x), r1=18(y), r2=76(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 18
LDI r2, 76
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
