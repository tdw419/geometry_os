; DESCRIPTION: Places a orange 88x57 rectangle at position (350, 87).
; PLAN: r0=350(x), r1=87(y), r2=88(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 87
LDI r2, 88
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
