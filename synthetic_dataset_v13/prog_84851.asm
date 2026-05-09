; DESCRIPTION: Places a orange 30x56 rectangle at position (43, 130).
; PLAN: r0=43(x), r1=130(y), r2=30(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 130
LDI r2, 30
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
