; DESCRIPTION: Places a orange 18x13 rectangle at position (492, 84).
; PLAN: r0=492(x), r1=84(y), r2=18(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 84
LDI r2, 18
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
