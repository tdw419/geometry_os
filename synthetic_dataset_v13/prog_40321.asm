; DESCRIPTION: Places a orange 63x84 rectangle at position (126, 115).
; PLAN: r0=126(x), r1=115(y), r2=63(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 115
LDI r2, 63
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
