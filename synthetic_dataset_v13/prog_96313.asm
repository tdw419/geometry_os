; DESCRIPTION: Places a orange 108x69 rectangle at position (3, 20).
; PLAN: r0=3(x), r1=20(y), r2=108(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 20
LDI r2, 108
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
