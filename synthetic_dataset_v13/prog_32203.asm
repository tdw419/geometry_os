; DESCRIPTION: Places a orange 53x91 rectangle at position (339, 148).
; PLAN: r0=339(x), r1=148(y), r2=53(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 148
LDI r2, 53
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
