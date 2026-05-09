; DESCRIPTION: Places a orange 82x31 rectangle at position (69, 106).
; PLAN: r0=69(x), r1=106(y), r2=82(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 106
LDI r2, 82
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
