; DESCRIPTION: Places a orange 73x40 rectangle at position (34, 88).
; PLAN: r0=34(x), r1=88(y), r2=73(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 88
LDI r2, 73
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
