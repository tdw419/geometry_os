; DESCRIPTION: Places a purple 62x35 rectangle at position (282, 109).
; PLAN: r0=282(x), r1=109(y), r2=62(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 109
LDI r2, 62
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
