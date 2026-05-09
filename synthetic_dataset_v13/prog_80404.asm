; DESCRIPTION: Places a orange 66x12 rectangle at position (114, 217).
; PLAN: r0=114(x), r1=217(y), r2=66(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 217
LDI r2, 66
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
