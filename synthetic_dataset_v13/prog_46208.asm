; DESCRIPTION: Places a orange 95x69 rectangle at position (78, 93).
; PLAN: r0=78(x), r1=93(y), r2=95(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 93
LDI r2, 95
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
