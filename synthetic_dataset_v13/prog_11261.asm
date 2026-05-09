; DESCRIPTION: Places a orange 46x23 rectangle at position (122, 56).
; PLAN: r0=122(x), r1=56(y), r2=46(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 56
LDI r2, 46
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
