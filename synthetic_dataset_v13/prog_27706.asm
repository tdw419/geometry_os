; DESCRIPTION: Places a orange 16x69 rectangle at position (23, 14).
; PLAN: r0=23(x), r1=14(y), r2=16(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 14
LDI r2, 16
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
