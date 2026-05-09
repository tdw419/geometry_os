; DESCRIPTION: Places a purple 76x78 rectangle at position (372, 63).
; PLAN: r0=372(x), r1=63(y), r2=76(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 63
LDI r2, 76
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
