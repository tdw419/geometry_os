; DESCRIPTION: Places a orange 21x88 rectangle at position (27, 105).
; PLAN: r0=27(x), r1=105(y), r2=21(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 105
LDI r2, 21
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
