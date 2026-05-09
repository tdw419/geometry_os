; DESCRIPTION: Places a purple 114x19 rectangle at position (16, 176).
; PLAN: r0=16(x), r1=176(y), r2=114(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 176
LDI r2, 114
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
