; DESCRIPTION: Places a orange 76x59 rectangle at position (114, 115).
; PLAN: r0=114(x), r1=115(y), r2=76(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 115
LDI r2, 76
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
