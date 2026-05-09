; DESCRIPTION: Places a orange 15x49 rectangle at position (72, 11).
; PLAN: r0=72(x), r1=11(y), r2=15(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 11
LDI r2, 15
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
