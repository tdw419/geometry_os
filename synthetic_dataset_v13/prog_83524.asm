; DESCRIPTION: Places a orange 106x82 rectangle at position (166, 26).
; PLAN: r0=166(x), r1=26(y), r2=106(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 26
LDI r2, 106
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
