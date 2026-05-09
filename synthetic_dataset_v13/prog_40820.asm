; DESCRIPTION: Places a orange 35x96 rectangle at position (113, 56).
; PLAN: r0=113(x), r1=56(y), r2=35(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 56
LDI r2, 35
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
