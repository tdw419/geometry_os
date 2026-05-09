; DESCRIPTION: Places a orange 64x13 rectangle at position (268, 14).
; PLAN: r0=268(x), r1=14(y), r2=64(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 14
LDI r2, 64
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
