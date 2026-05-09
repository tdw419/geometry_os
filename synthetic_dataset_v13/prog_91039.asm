; DESCRIPTION: Places a purple 24x19 rectangle at position (155, 184).
; PLAN: r0=155(x), r1=184(y), r2=24(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 184
LDI r2, 24
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
