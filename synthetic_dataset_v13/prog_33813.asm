; DESCRIPTION: Places a purple 108x12 rectangle at position (59, 56).
; PLAN: r0=59(x), r1=56(y), r2=108(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 56
LDI r2, 108
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
