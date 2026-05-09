; DESCRIPTION: Places a magenta 55x13 rectangle at position (22, 181).
; PLAN: r0=22(x), r1=181(y), r2=55(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 181
LDI r2, 55
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
