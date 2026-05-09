; DESCRIPTION: Places a orange 118x53 rectangle at position (85, 140).
; PLAN: r0=85(x), r1=140(y), r2=118(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 140
LDI r2, 118
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
