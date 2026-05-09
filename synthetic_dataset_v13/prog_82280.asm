; DESCRIPTION: Places a orange 94x62 rectangle at position (14, 5).
; PLAN: r0=14(x), r1=5(y), r2=94(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 5
LDI r2, 94
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
