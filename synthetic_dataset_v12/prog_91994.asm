; DESCRIPTION: Places a purple 62x67 rectangle at position (159, 170).
; PLAN: r0=159(x), r1=170(y), r2=62(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 170
LDI r2, 62
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
