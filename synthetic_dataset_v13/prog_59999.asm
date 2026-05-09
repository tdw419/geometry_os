; DESCRIPTION: Places a purple 69x63 rectangle at position (202, 181).
; PLAN: r0=202(x), r1=181(y), r2=69(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 181
LDI r2, 69
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
