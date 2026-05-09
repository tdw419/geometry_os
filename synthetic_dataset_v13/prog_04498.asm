; DESCRIPTION: Places a purple 45x23 rectangle at position (172, 184).
; PLAN: r0=172(x), r1=184(y), r2=45(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 184
LDI r2, 45
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
