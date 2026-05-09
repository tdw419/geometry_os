; DESCRIPTION: Places a purple 108x74 rectangle at position (387, 153).
; PLAN: r0=387(x), r1=153(y), r2=108(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 153
LDI r2, 108
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
