; DESCRIPTION: Places a orange 74x44 rectangle at position (166, 76).
; PLAN: r0=166(x), r1=76(y), r2=74(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 76
LDI r2, 74
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
