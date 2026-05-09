; DESCRIPTION: Places a orange 69x30 rectangle at position (35, 218).
; PLAN: r0=35(x), r1=218(y), r2=69(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 218
LDI r2, 69
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
