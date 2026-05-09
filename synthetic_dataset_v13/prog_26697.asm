; DESCRIPTION: Places a orange 30x35 rectangle at position (296, 31).
; PLAN: r0=296(x), r1=31(y), r2=30(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 31
LDI r2, 30
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
