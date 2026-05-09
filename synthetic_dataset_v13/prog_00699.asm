; DESCRIPTION: Places a orange 84x33 rectangle at position (6, 130).
; PLAN: r0=6(x), r1=130(y), r2=84(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 130
LDI r2, 84
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
