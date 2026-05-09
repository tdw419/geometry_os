; DESCRIPTION: Places a purple 108x82 rectangle at position (181, 29).
; PLAN: r0=181(x), r1=29(y), r2=108(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 29
LDI r2, 108
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
