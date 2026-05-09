; DESCRIPTION: Places a purple 114x64 rectangle at position (38, 122).
; PLAN: r0=38(x), r1=122(y), r2=114(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 122
LDI r2, 114
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
