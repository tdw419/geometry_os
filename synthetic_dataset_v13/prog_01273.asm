; DESCRIPTION: Places a orange 10x63 rectangle at position (244, 87).
; PLAN: r0=244(x), r1=87(y), r2=10(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 87
LDI r2, 10
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
