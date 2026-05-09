; DESCRIPTION: Places a purple 69x32 rectangle at position (34, 220).
; PLAN: r0=34(x), r1=220(y), r2=69(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 220
LDI r2, 69
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
