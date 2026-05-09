; DESCRIPTION: Places a orange 112x69 rectangle at position (38, 23).
; PLAN: r0=38(x), r1=23(y), r2=112(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 23
LDI r2, 112
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
