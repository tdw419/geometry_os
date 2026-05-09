; DESCRIPTION: Places a orange 114x26 rectangle at position (253, 106).
; PLAN: r0=253(x), r1=106(y), r2=114(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 106
LDI r2, 114
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
