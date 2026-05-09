; DESCRIPTION: Places a purple 106x76 rectangle at position (339, 73).
; PLAN: r0=339(x), r1=73(y), r2=106(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 73
LDI r2, 106
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
