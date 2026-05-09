; DESCRIPTION: Places a orange 19x11 rectangle at position (4, 155).
; PLAN: r0=4(x), r1=155(y), r2=19(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 155
LDI r2, 19
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
