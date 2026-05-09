; DESCRIPTION: Places a orange 43x99 rectangle at position (278, 149).
; PLAN: r0=278(x), r1=149(y), r2=43(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 149
LDI r2, 43
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
