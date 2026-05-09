; DESCRIPTION: Places a orange 91x82 rectangle at position (67, 127).
; PLAN: r0=67(x), r1=127(y), r2=91(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 127
LDI r2, 91
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
