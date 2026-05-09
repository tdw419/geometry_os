; DESCRIPTION: Places a orange 119x58 rectangle at position (34, 90).
; PLAN: r0=34(x), r1=90(y), r2=119(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 90
LDI r2, 119
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
