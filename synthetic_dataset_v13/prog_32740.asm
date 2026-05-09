; DESCRIPTION: Places a orange 42x83 rectangle at position (166, 114).
; PLAN: r0=166(x), r1=114(y), r2=42(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 114
LDI r2, 42
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
