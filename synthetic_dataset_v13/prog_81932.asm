; DESCRIPTION: Places a orange 52x46 rectangle at position (9, 155).
; PLAN: r0=9(x), r1=155(y), r2=52(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 155
LDI r2, 52
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
