; DESCRIPTION: Places a orange 14x19 rectangle at position (442, 34).
; PLAN: r0=442(x), r1=34(y), r2=14(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 34
LDI r2, 14
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
