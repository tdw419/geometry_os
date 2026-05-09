; DESCRIPTION: Places a purple 69x100 rectangle at position (55, 138).
; PLAN: r0=55(x), r1=138(y), r2=69(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 138
LDI r2, 69
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
