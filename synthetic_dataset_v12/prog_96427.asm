; DESCRIPTION: Places a orange 84x48 rectangle at position (183, 49).
; PLAN: r0=183(x), r1=49(y), r2=84(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 49
LDI r2, 84
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
