; DESCRIPTION: Places a orange 89x34 rectangle at position (114, 153).
; PLAN: r0=114(x), r1=153(y), r2=89(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 153
LDI r2, 89
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
