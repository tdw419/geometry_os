; DESCRIPTION: Places a orange 110x28 rectangle at position (296, 217).
; PLAN: r0=296(x), r1=217(y), r2=110(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 217
LDI r2, 110
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
