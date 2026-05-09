; DESCRIPTION: Places a magenta 23x19 rectangle at position (412, 116).
; PLAN: r0=412(x), r1=116(y), r2=23(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 116
LDI r2, 23
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
