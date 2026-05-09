; DESCRIPTION: Places a purple 69x63 rectangle at position (366, 164).
; PLAN: r0=366(x), r1=164(y), r2=69(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 164
LDI r2, 69
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
