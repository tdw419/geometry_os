; DESCRIPTION: Places a orange 38x113 rectangle at position (149, 56).
; PLAN: r0=149(x), r1=56(y), r2=38(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 56
LDI r2, 38
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
