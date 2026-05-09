; DESCRIPTION: Places a orange 102x15 rectangle at position (216, 34).
; PLAN: r0=216(x), r1=34(y), r2=102(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 34
LDI r2, 102
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
