; DESCRIPTION: Places a orange 69x26 rectangle at position (72, 59).
; PLAN: r0=72(x), r1=59(y), r2=69(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 59
LDI r2, 69
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
