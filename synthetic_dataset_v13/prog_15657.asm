; DESCRIPTION: Places a orange 81x28 rectangle at position (9, 30).
; PLAN: r0=9(x), r1=30(y), r2=81(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 30
LDI r2, 81
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
