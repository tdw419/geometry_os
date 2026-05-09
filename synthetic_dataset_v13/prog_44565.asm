; DESCRIPTION: Places a orange 88x96 rectangle at position (76, 58).
; PLAN: r0=76(x), r1=58(y), r2=88(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 58
LDI r2, 88
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
