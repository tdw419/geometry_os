; DESCRIPTION: Places a orange 62x72 rectangle at position (367, 6).
; PLAN: r0=367(x), r1=6(y), r2=62(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 6
LDI r2, 62
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
