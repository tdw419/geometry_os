; DESCRIPTION: Places a purple 58x29 rectangle at position (353, 164).
; PLAN: r0=353(x), r1=164(y), r2=58(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 164
LDI r2, 58
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
