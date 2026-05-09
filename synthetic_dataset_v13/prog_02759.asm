; DESCRIPTION: Places a orange 20x46 rectangle at position (409, 101).
; PLAN: r0=409(x), r1=101(y), r2=20(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 101
LDI r2, 20
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
