; DESCRIPTION: Places a orange 88x83 rectangle at position (206, 10).
; PLAN: r0=206(x), r1=10(y), r2=88(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 10
LDI r2, 88
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
