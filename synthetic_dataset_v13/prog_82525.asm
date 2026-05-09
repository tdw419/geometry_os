; DESCRIPTION: Places a orange 108x39 rectangle at position (60, 108).
; PLAN: r0=60(x), r1=108(y), r2=108(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 108
LDI r2, 108
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
