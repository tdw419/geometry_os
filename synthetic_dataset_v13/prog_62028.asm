; DESCRIPTION: Places a purple 69x114 rectangle at position (43, 54).
; PLAN: r0=43(x), r1=54(y), r2=69(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 54
LDI r2, 69
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
