; DESCRIPTION: Places a orange 91x82 rectangle at position (113, 58).
; PLAN: r0=113(x), r1=58(y), r2=91(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 58
LDI r2, 91
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
