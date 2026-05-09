; DESCRIPTION: Places a orange 81x84 rectangle at position (150, 40).
; PLAN: r0=150(x), r1=40(y), r2=81(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 40
LDI r2, 81
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
