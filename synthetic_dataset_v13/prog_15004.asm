; DESCRIPTION: Places a purple 22x35 rectangle at position (376, 184).
; PLAN: r0=376(x), r1=184(y), r2=22(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 184
LDI r2, 22
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
